//
//  ValueOfControlsView.swift
//  AccessibilitySandbox
//
//  Created by William Boles on 20/06/2025.
//

import SwiftUI

struct ValueOfControlsView: View {
    @State private var value = 10
    
    var body: some View {
        VStack {
            Text("Value: \(value)")

            Button("Increment") {
                value += 1
            }

            Button("Decrement") {
                value -= 1
            }
        }
        .accessibilityElement() // is the same as .accessibilityElement(children: .ignore)
        .accessibilityLabel("Value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled.")
            }
        }
    }
}

#Preview {
    ValueOfControlsView()
}
