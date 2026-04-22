//
//  AbsolutePositioningView.swift
//  LayoutAndGeometry
//
//  Created by William Boles on 17/12/2025.
//

import SwiftUI

struct AbsolutePositioningView: View {
    var body: some View {
        VStack {
            // note how the order of modifiers changes the UI presentation
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .position(x: 100, y: 100)
                .background(.red)
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(.red)
                .position(x: 100, y: 100)
        }
    }
}

#Preview {
    AbsolutePositioningView()
}
