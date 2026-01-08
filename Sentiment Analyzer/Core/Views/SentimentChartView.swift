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
                angle: .value("Type", item.count),
                innerRadius: .ratio(0.75),
                //outerRadius: .inset(10),
                //angularInset: 1
            )
            //.cornerRadius(4)
            .foregroundStyle(by: .value("sentiment", item.sentiment))
            //.foregroundStyle(by: item.sentiment)
        }
//        .overlay {
//            Image(systemName: "location")
//                .resizable()
//                .frame(width: 48, height: 48)
//        }
        .chartLegend(position: .trailing, alignment: .center)
        .chartForegroundStyleScale([
            Sentiment.positive: Sentiment.positive.color,
            Sentiment.moderate: Sentiment.moderate.color,
            Sentiment.negative: Sentiment.negative.color
        ])
        .animation(.bouncy, value: sentiments)
        .frame(height: 200)
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
