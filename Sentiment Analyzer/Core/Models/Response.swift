//
//  Response.swift
//  Sentiment Analyzer
//
//  Created by Hello World on 1/7/26.
//

import Foundation
import SwiftData

@Model
class Response {
    //let id: UUID = UUID();
    
    init(text: String, sentiment: Sentiment) {
        self.text = text
        self.sentiment = sentiment
    }
    var date: Date = Date()
    var text: String
    var sentiment: Sentiment
}

extension Response {
    static let samples: [Response] = [
        .init(text: "I love this job", sentiment: .positive),
        .init(text: "I hate this job", sentiment: .negative)
    ]
    
    @MainActor
    static let previewContainer: ModelContainer = {
        let container = try! ModelContainer(for: Response.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        for response in Response.samples {
            container.mainContext.insert(response)
        }
        
        return container
    }()
}

