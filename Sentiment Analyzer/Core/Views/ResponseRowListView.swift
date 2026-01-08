//
//  ResponseRowListView.swift
//  Sentiment Analyzer
//
//  Created by Hello World on 1/7/26.
//

import SwiftUI

struct ResponseRowListView: View {
    
    let responses: [Response]
    let onSwipeDelete: (Response) -> Void
    
    var body: some View {
        List {
            ForEach(responses, id: \.persistentModelID) { response in
                ResponseRowView(response: response)
                    .swipeActions(edge: .trailing) {
                        Button("Delete", role: .destructive) {
                            onSwipeDelete(response)
                        }
                    }
            }
        }
        .listStyle(.plain)
        .animation(.default, value: responses)
    }
}

//#Preview {
//    ResponseRowListView()
//}
