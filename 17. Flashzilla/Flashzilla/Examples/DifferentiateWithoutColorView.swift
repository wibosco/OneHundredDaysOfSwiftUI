//
//  DifferentiateWithoutColorView.swift
//  Flashzilla
//
//  Created by William Boles on 12/12/2025.
//

import SwiftUI

struct DifferentiateWithoutColorView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundStyle(.white)
        .clipShape(.capsule)
    }
}

#Preview {
    DifferentiateWithoutColorView()
}
