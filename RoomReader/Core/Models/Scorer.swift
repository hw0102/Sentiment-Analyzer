//
//  Scorer.swift
//  RoomReader
//
//  Created by Hello World on 1/7/26.
//

import NaturalLanguage


struct Scorer {
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    /// return a sentiment score of first paragraph for a body of text
    func score(_ text: String) -> Double {
        var sentimentScore: Double = 0
        tagger.string = text
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .paragraph, scheme: .sentimentScore) { tag, _ in
            if let sentimentString = tag?.rawValue, let score = Double(sentimentString) {
                sentimentScore = score
            }
            return false;
        }
        return sentimentScore
    }
    
    static let shared = Scorer()
    
    private init() {}
}
