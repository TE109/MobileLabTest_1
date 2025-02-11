//
//  Lab1_tomer_edelmanApp.swift
//  Lab1_tomer_edelman
//
//  Created by user271259 on 2/10/25.
//

import SwiftUI
import SwiftData

@main
struct Lab1_tomer_edelmanApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
