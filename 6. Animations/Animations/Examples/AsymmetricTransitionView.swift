//
//  ContentView.swift
//  Animations
//
//  Created by William Boles on 26/05/2025.
//

import SwiftUI

struct AsymmetricTransitionView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    AsymmetricTransitionView()
}
