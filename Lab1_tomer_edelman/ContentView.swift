//
//  ContentView.swift
//  Lab1_tomer_edelman
//
//  Created by user271259 on 2/10/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]  // Query items from the model context
    
    var body: some View {
        VStack {
            Text("Random Number: \(Int.random(in: 1..<100))")  // Display the random number
            

        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)  // For preview purposes, using in-memory storage
}
