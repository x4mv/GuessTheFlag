//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by sergio caceres on 2024-04-12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Nigeria",
                     "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    
    @State private var correctAnswers = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    
    @State private var showingWinner = false
    @State private var WinnerTitle = ""
    
    
    
    
    var body: some View {
        ZStack{
            
            RadialGradient(stops: [
                .init(color: .mint, location: 0.3),
                .init(color: .indigo, location: 0.3)
            ],center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack{
                //title of the game
                Text("Guess the flag")
                    .font(.largeTitle).bold()
                
                
                VStack (spacing: 20){
                    
                    // which flag has to guess
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.indigo)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswers])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    // displaying the flag options
                    ForEach(0..<3){ number in
                        Button(){
                            // Flag was tapped
                            flagTapped(number)
                            
                        }label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                        
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 20))
                .padding(15)
                
                
                Text("Your score is \(score)")
                    .font(.largeTitle.weight(.medium))
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
            
        }
        .alert(WinnerTitle, isPresented: $showingWinner){
            Button("Restart Game"){}
        } message: {
            Text("Congratulations you've won the game with 8 correct answers!!!")
        }
        
    }
    
    // Creating the logic for the app 
    
    func flagTapped (_ number: Int){
        if number == correctAnswers {
            scoreTitle = "Correct"
            score += 1
        
            if score == 8 {
                showingWinner = true
                score = 0
                return
            }
        }else{
            scoreTitle = "Wrong"
            score = 0
        }
        
        showingScore = true
    }
    
    
    func askQuestion(){
        countries.shuffle()
        correctAnswers = Int.random(in: 0...2)
    }
        
}

#Preview {
    ContentView()
}
