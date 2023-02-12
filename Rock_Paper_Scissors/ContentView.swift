//
//  ContentView.swift
//  Rock_Paper_Scissors
//
//  Created by Thaddäus Schima on 12.02.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var tries = 0
    @State private var scoreTitle = ""
    @State private var rockPaperScissors = ["✂️", "🪨", "📄"].shuffled()
    private var correctAnswer: String {
            return ""
    }
    @State private var userScore = 0
    var body: some View {
        VStack {
            Text("\(rockPaperScissors[correctAnswer])")
                .font(.largeTitle)
            HStack {
                ForEach(0..<3) {number in
                    Button {
                        buttonTapped(number)
                    } label: {
                        Text(rockPaperScissors[number]).font(.largeTitle)
                    }
                    
                }
            }
            Text(correctAnswer)
        .padding()
        }.alert(scoreTitle, isPresented: $showingScore) {
            Button("Restart Game?", action: resetScore)
        } message: {
            Text("You got \(userScore) points.")
        }
        
           
    }
    func buttonTapped(_ number: Int) {
        if number == correctAnswer {
            userScore += 1
        } else {
            userScore -= 1
        }
        tries += 1
        printResult()
        rockPaperScissors.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func printResult() {
        if tries == 10 {
            showingScore = true
            
        }
    }
    func resetScore() {
        tries = 0
        userScore = 0
    }
    func isCorrectAnswer(_ number: Int) -> Bool {
        return false
    }
    func correctAnswer(_ number: Int) -> String {
        
        return ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
