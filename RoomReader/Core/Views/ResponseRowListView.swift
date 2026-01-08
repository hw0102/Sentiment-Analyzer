//
//  ResponseRowListView.swift
//  RoomReader
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
        .contentMargins(.bottom, 60)
        .listStyle(.plain)
        .overlay {
            if(responses.isEmpty) {
                ContentUnavailableView("No responses yet", systemImage: "list.bullet.indent", description: Text("Add a response to start"))
            }
        }
        .animation(.default, value: responses)
    }
}

//#Preview {
//    ResponseRowListView()
//}
