//
//  ContentView.swift
//  Lab1_tomer_edelman
//
//  Created by user271259 on 2/10/25.
//

import SwiftUI
import SwiftData

// TODO
// Add State Variavle to store how many times correct or Not

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var num = Int.random(in: 1..<100)
    @State private var selectedImage: String = ""
    @State private var answers = (correct: 0, incorrect: 0)
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Random Number: \(num)")
                .padding()
            
            Text("Prime")
                .padding()
                .onTapGesture {
                    if !isPrime(num) {
                        selectedImage = "Red_X.svg"
                        answers.correct -= 1
                    } else {
                        selectedImage = "istockphoto-1205148147-612x612"
                        answers.correct += 1
                    }
                    num = Int.random(in: 1..<100)
                    checkAnswer()
                }
            
            
            Text("Not Prime")
                .padding()
                .onTapGesture {
                    if !isPrime(num) {
                        selectedImage = "istockphoto-1205148147-612x612"
                        answers.correct += 1
                    } else {
                        selectedImage = "Red_X.svg"
                        answers.correct -= 1
                    }
                    num = Int.random(in: 1..<100)
                    checkAnswer()
                }
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Answers"),
                        message: Text("Correct: \(answers.correct), Incorrect: \(answers.incorrect)"),
                        dismissButton: .default(Text("OK"))
                    )
                }
            Image(selectedImage)
                .resizable()
                .scaledToFit()
            
            
        }
        .padding()
    }
    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
    
    func checkAnswer() {
        if(answers.correct + answers.incorrect == 10){
            showAlert = true
        }
    }
}


#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
