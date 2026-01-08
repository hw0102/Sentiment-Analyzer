//
//  Sentiment.swift
//  RoomReader
//
//  Created by Hello World on 1/7/26.
//

import Charts
import SwiftUI

enum Sentiment: String, Plottable, Codable, CaseIterable {
    
    case positive, moderate, negative
    
    init(_ score: Double) {
        if score > 0.2 {
            self = .positive
        } else if score < -0.2 {
            self = .negative
        } else {
            self = .moderate
        }
    }

}

extension Sentiment {
    static let examples: [Self] = [.positive, .negative, .positive, .moderate];
}

extension Sentiment {
    
    
    /// Text representation of a Sentiment instance
    var description: String {
        switch self {
        case .positive:
            "Positive"
        case .moderate:
            "Moderate"
        case .negative:
            "Negative"
        }
    }
    
    /// Associated icon of a Sentiment instance
    var icon: String {
        switch self {
        case .positive:
            "chevron.up.2"
        case .moderate:
            "minus"
        case .negative:
            "chevron.down.2"
        }
    }
    
    /// Associated color of a Sentiment instance
    var color: Color {
        switch self {
        case .positive:
            .teal
        case .moderate:
            .gray
        case .negative:
            .red
        }
    }
}
