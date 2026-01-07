//
//  Sentiment.swift
//  Sentiment Analyzer
//
//  Created by Hello World on 1/7/26.
//

import Charts
import SwiftUI

enum Sentiment: String, Plottable {
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

//extension Sentiment {
//    static let example: Self = .positive;
//}

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
            "chevron.down.2"
        case .negative:
            "minus"
        }
    }
    
    /// Associated color of a Sentiment instance
    var color: Color {
        switch self {
        case .positive:
            .teal
        case .moderate:
            .red
        case .negative:
            .gray
        }
    }
}
