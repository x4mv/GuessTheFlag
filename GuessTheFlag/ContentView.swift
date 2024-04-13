//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by sergio caceres on 2024-04-12.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertShown = false
    var body: some View {
        ZStack{
            VStack(spacing:0){
                Color.red
                Color.blue
            }
            
            Button("There is a question", action: handleClick)
            .foregroundStyle(.white)
            
            .alert("important message", isPresented: $alertShown) {
                Button("OK", role: .destructive, action: handleOk)
                Button("Cancel", role: .cancel) {}
            }
            
                
        }
        .ignoresSafeArea()
        
    }
    
    func handleClick(){
        print("haz hecho click")
        alertShown = true
    }
    
    func handleOk(){
        print("click in ok")
    }
        
}

#Preview {
    ContentView()
}
