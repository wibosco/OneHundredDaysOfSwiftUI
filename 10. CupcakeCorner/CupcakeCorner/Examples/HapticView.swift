//
//  HapticView.swift
//  CupcakeCorner
//
//  Created by William Boles on 06/06/2025.
//

import SwiftUI

struct HapticView: View {
    @State private var counter = 0
    
    var body: some View {
        Button("Tap Count: \(counter)") {
            counter += 1
        }
        .sensoryFeedback(.increase, trigger: counter)
    }
}

#Preview {
    HapticView()
}
