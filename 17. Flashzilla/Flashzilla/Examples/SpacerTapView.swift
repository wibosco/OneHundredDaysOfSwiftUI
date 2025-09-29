//
//  SpacerTapView.swift
//  Flashzilla
//
//  Created by William Boles on 11/07/2025.
//

import SwiftUI

struct SpacerTapView: View {
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                Text("Hello")
                // tapping on the spacer won't trigger the print statement
                Spacer().frame(height: 100)
                Text("World")
            }
            .onTapGesture {
                print("VStack tapped!")
            }
            
            VStack {
                Text("Hello")
                // tapping on the spacer will trigger the print statement
                Spacer().frame(height: 100)
                Text("World")
            }
            .contentShape(.rect)
            .onTapGesture {
                print("VStack tapped!")
            }
        }
    }
}

#Preview {
    SpacerTapView()
}
