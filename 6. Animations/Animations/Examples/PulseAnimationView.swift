//
//  AnimationView.swift
//  Animations
//
//  Created by William Boles on 26/05/2025.
//

import SwiftUI

struct PulseAnimationView: View {
    @State private var animationAmount = 1.0

        var body: some View {
            Button("Tap Me") { }
            .padding(50)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
            )
            .onAppear {
                animationAmount = 2
            }
        }
}

#Preview {
    PulseAnimationView()
}
