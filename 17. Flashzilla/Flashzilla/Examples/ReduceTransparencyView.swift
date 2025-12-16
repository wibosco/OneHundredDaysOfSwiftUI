//
//  ReduceTransparencyView.swift
//  Flashzilla
//
//  Created by William Boles on 12/12/2025.
//

import SwiftUI

struct ReduceTransparencyView: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTranparency
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .background(reduceTranparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    ReduceTransparencyView()
}
