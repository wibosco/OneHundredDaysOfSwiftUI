//
//  GuessTheFlagView.swift
//  Animations
//
//  Created by William Boles on 26/05/2025.
//

import SwiftUI

struct GuessTheFlagView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var selectedFlag = -1
    @State private var animationAmount = 0.0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            selectedFlag = number
                            animationAmount += 360
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                                .opacity(selectedFlag == -1 ? 1.0 : number == selectedFlag ? 1.0 : 0.15)
                                .scaleEffect(selectedFlag == -1 ? 1.0 : number == selectedFlag ? 1.0 : 0.15)
                                .animation(.default, value: selectedFlag)
                                // 3D rotate has to go under animation to avoid double animations
                                .rotation3DEffect(number == selectedFlag ? .degrees(animationAmount) : .degrees(0), axis: (x: 0, y: 0, z: 1))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 5))
            }
            .padding()
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    GuessTheFlagView()
}
