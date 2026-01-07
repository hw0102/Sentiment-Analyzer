//
//  ContentView.swift
//  Sentiment Analyzer
//
//  Created by Hello World on 1/7/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var text = ""
    @Query(sort: \Response.date, order: .reverse) private var responses: [Response]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Text("Chart")
                Text("Overview Section")
                
                ForEach(responses, id: \.self) { response in
                    ResponseRowView(response: response)
                }
                
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                TextField("What's on your mind?", text: $text, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(10)
                
                Button("Done") {
                    let score = Scorer.shared.score(text)
                    modelContext.insert(Response(text: text, sentiment: .init(score)))
                    text = ""
                }
                .disabled(text.isEmpty)
            }
            .padding()
            .background(Material.thin)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(Response.previewContainer)
}
