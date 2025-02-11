//
//  ContentView.swift
//  Lab1_tomer_edelman
//
//  Created by user271259 on 2/10/25.
//


// TODO ADD TIMER

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    // The variables use @State so they can be updated in the code
    // Generate a random Number from 1 to 99
    @State private var num = Int.random(in: 1..<100)
    // A variable to store the name of the image to select Thats mutable
    @State private var selectedImage: String = ""
    // A Tuple to store the number of correct and incorrect answers
    @State private var answers = (correct: 0, incorrect: 0)
    // A Boolean variable to that decides when to show
    @State private var showAlert = false
    // Timer Variable to store a refrence to a timer element 
    @State private var timer: Timer? = nil
    
    var body: some View {
        VStack {
            Text("Random Number: \(num)")
                .padding()
            
            Text("Prime")
                .padding()
                .onTapGesture {
                    if !isPrime(num) {
                        selectedImage = "Red_X.svg"
                        answers.incorrect += 1
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
                        answers.incorrect += 1
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
        .onAppear {
            startTimer()
        }
    }
    
    func isPrime(_ number: Int) -> Bool {
        return number > 1 && !(2..<number).contains { number % $0 == 0 }
    }
    
    func checkAnswer() {
        if(answers.correct + answers.incorrect == 10){
            showAlert = true
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in selectedImage = "Red_X.svg";  answers.incorrect += 1
            num = Int.random(in: 1..<100)
            checkAnswer()
        }
        
        
    }
    
}
    #Preview {
        ContentView()
            .modelContainer(for: Item.self, inMemory: true)
    }

