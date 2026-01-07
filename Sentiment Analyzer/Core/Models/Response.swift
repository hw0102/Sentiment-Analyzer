//
//  Response.swift
//  Sentiment Analyzer
//
//  Created by Hello World on 1/7/26.
//

import Foundation

struct Response: Identifiable {
    let id: UUID = UUID();
    let text: String;
    let sentiment: Sentiment;
}

extension Response {
    static let samples: [Response] = [
        .init(text: "I love this job", sentiment: .positive),
        .init(text: "I hate this job", sentiment: .negative)
    ]
}
