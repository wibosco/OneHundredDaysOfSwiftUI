//
//  RotateGestureView.swift
//  Flashzilla
//
//  Created by William Boles on 11/07/2025.
//

import SwiftUI

struct RotateGestureView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero
    
    var body: some View {
        Text("Rotate Gesture")
            .rotationEffect(currentAmount + finalAmount)
            .gesture(
                RotateGesture()
                    .onChanged({ value in
                        currentAmount = value.rotation
                    })
                    .onEnded({ value in
                        finalAmount += currentAmount
                        currentAmount = .zero
                    })
            )
    }
}

#Preview {
    RotateGestureView()
}
