//
//  SentimentChartView.swift
//  Sentiment Analyzer
//
//  Created by Hello World on 1/7/26.
//

import SwiftUI
import Charts

/// Donut chart view of sentiment break downs
struct SentimentChartView: View {
    
    let sentiments: [Sentiment]
    
    var body: some View {
        Chart(chartData, id: \.sentiment) { item in
            SectorMark(
                angle: .value("Value", item.count),
                innerRadius: .ratio(0.618),
                outerRadius: .inset(10),
                angularInset: 1
            )
            .cornerRadius(4)
            .foregroundStyle(item.sentiment.color)
        }
    }

    
    private var chartData: [(sentiment: Sentiment, count: Int)] {
        let counts = sentiments.reduce(into: [Sentiment: Int]()) { result, sentiment in
            result[sentiment, default: 0] += 1
        }
        let order: [Sentiment] = [.positive, .moderate, .negative]
        return order.compactMap { sentiment in
            guard let count = counts[sentiment] else { return nil }
            return (sentiment, count)
        }
    }
}

#Preview {
    SentimentChartView(sentiments: Sentiment.examples)
}
