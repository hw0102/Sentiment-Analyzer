//
//  Sentiment_AnalyzerApp.swift
//  RoomReader
//
//  Created by Hello World on 1/7/26.
//

import SwiftUI
import SwiftData

@main
struct Sentiment_AnalyzerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Response.self)
    }
}
