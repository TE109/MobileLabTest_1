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
    
    var body: some View {
        VStack {
            Text("Random Number: \(num)")
                .padding()
            
            Text("Prime")
                .padding()
                .onTapGesture {
                    num = 2
                }
            
            Text("Not Prime")
                .padding()
                .onTapGesture {
                    if(isPrime(<#T##number: Int##Int#>)){
                        num = 22
                    }
                }
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
