//
//  RelativePositioningView.swift
//  LayoutAndGeometry
//
//  Created by William Boles on 17/12/2025.
//

import SwiftUI

struct RelativePositioningView: View {
    var body: some View {
        VStack(spacing: 20) {
            // note how the order of modifiers changes the UI presentation
            
            Text("Hello, world!")
                .offset(x: 100, y: 100)
                .background(.red)
            
            Text("Hello, world!")
                .background(.red)
                .offset(x: 100, y: 100)
        }
    }
}

#Preview {
    RelativePositioningView()
}
