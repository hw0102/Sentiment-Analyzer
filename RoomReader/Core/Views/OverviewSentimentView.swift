//
//  OverviewSentimentView.swift
//  RoomReader
//
//  Created by Hello World on 1/7/26.
//

import SwiftUI

struct OverviewSentimentView: View {
    let sentiments: [Sentiment]
    
    private var sentimentBreakDown: [Sentiment: Int] {
        sentiments.reduce(into: [:]) { result, sentiment in
            result[sentiment, default: 0] += 1
        }
    }
    
    private var overallSentimentSummary: (label: String, color: Color) {
        let total = sentiments.count
        guard total > 0 else { return ("N/A", .gray) }

        let sorted = sentimentBreakDown.sorted { $0.value > $1.value }
        guard let top = sorted.first else { return ("N/A", .gray) }

        if sorted.count > 1, top.value == sorted[1].value {
            return ("Mixed", .gray)
        }

        let share = Double(top.value) / Double(total)
        if share < 0.5 {
            return ("Leaning \(top.key.description)", top.key.color)
        }

        return (top.key.description, top.key.color)
    }
    
    private func calculatePct(for sentiment: Sentiment) -> Int {
        let total = sentiments.count
        guard total > 0 else { return 0 }
        let count = sentimentBreakDown[sentiment] ?? 0
        return Int(round((Double(count) / Double(total)) * 100))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "chart.pie")
                Text("Overall Sentiment")
            }
            HStack {
                // dynamic
                Text(overallSentimentSummary.label)
                    .foregroundStyle(overallSentimentSummary.color)
                    //.foregroundStyle(overallSentimentSum?.color ?? .gray)
                
                Spacer()
                
                Text("\(sentiments.count) \(sentiments.count > 1 ? "responses" : "response")")
                
            }
            
            HStack {
                ForEach(Sentiment.allCases, id: \.self) { sentiment in
                    SentimentPillView(sentiment: sentiment, percentage: calculatePct(for: sentiment))
                }
            }
            
        }
        .safeAreaPadding(.horizontal)
    }
}


private struct SentimentPillView: View {
    let sentiment: Sentiment
    let percentage: Int
    var body: some View {
        VStack {
            HStack {
                Image(systemName: sentiment.icon)
                    .imageScale(.small)
                Text(sentiment.description)
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            Text(percentage, format: .number)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(sentiment.color.opacity(0.12), in: .capsule)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    OverviewSentimentView(sentiments: Sentiment.examples)
}
