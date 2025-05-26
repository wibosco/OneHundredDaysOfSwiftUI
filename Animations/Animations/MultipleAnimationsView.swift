//
//  MultipleAnimationsView.swift
//  Animations
//
//  Created by William Boles on 26/05/2025.
//

import SwiftUI

struct MultipleAnimationsView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled) //using nil prevents any changes above being included in any animation below
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
        .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
    }
}

#Preview {
    MultipleAnimationsView()
}
