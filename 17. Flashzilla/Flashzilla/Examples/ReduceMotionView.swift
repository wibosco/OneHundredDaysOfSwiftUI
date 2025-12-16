//
//  ReduceMotionView.swift
//  Flashzilla
//
//  Created by William Boles on 12/12/2025.
//

import SwiftUI

struct ReduceMotionView: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    var body: some View {
        Button("Hello, World!") {
            withOptionalAnimation {
                scale *= 1.5
            }

// Use this or `withOptionalAnimation`
//            if reduceMotion {
//                scale *= 1.5
//            } else {
//                withAnimation {
//                    scale *= 1.5
//                }
//            }
        }
        .scaleEffect(scale)
    }
}

// A helper to reduce boiler code for supporting reduced motion
func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

#Preview {
    ReduceMotionView()
}
