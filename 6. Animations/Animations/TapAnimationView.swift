//
//  TapAnimationView.swift
//  Animations
//
//  Created by William Boles on 26/05/2025.
//

import SwiftUI

struct TapAnimationView: View {
    @State private var animationAmount = 1.0

       var body: some View {
           Button("Tap Me") {
               animationAmount += 1
           }
           .padding(50)
           .background(.red)
           .foregroundStyle(.white)
           .clipShape(.circle)
           .scaleEffect(animationAmount)
           .animation(
               .easeInOut(duration: 1)
                   .repeatForever(autoreverses: true),
               value: animationAmount
           )
       }
}

#Preview {
    TapAnimationView()
}
