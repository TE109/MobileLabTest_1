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
    @State private var num = Int.random(in: 1..<100)
    @State private var selectedImage: String = "istockphoto-1205148147-612x612"
    
    var body: some View {
        VStack {
            Text("Random Number: \(num)")
                .padding()
            
            Text("Prime")
                .padding()
                .onTapGesture {
                    if !isPrime(num) {
                        selectedImage = "Red_X.svg"
                    } else {
                        selectedImage = "istockphoto-1205148147-612x612"
                    }
                    num = Int.random(in: 1..<100)
                }
            
            
            Text("Not Prime")
                .padding()
                .onTapGesture {
                    if !isPrime(num) {
                        selectedImage = "istockphoto-1205148147-612x612"
                    } else {
                        selectedImage = "Red_X.svg"
                    }
                    num = Int.random(in: 1..<100)
                }
            
            Image(selectedImage)
                .resizable()
                .scaledToFit()
        }
        .padding()
    }
}

func isPrime(_ number: Int) -> Bool {
    return number > 1 && !(2..<number).contains { number % $0 == 0 }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
