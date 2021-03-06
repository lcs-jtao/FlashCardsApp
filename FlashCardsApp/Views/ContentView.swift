//
//  ContentView.swift
//  FlashCardsApp
//
//  Created by Joyce Tao on 2021-12-07.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    // This is the card we are currently quizzing on
    @State var currentCard: Card = listOfCards.randomElement()!
    // This controls whether the answer is visible
    @State var isAnswerShowing = false
    
    // MARK: Computed properties
    var body: some View {
        VStack(spacing: 25) {
            
            // Output
            Text(currentCard.question)
                .font(.largeTitle)
            
            // Input
            Button(action: {
                withAnimation {
                    isAnswerShowing = true
                }
            },
                   label: {
                Text("Check")
            })
                .buttonStyle(.bordered)
            
            // Output
            Text(currentCard.answer)
                .font(.title)
            //              CONDITION      true  false
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            
            // Input
            Button(action: {
                // Hide the answer
                isAnswerShowing = false
                // Pick a new card
                currentCard = listOfCards.randomElement()!
            },
                   label: {
                Text("Another")
            })
                .buttonStyle(.bordered)
                .opacity(isAnswerShowing ? 1.0 : 0.0)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Flash Cards")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
