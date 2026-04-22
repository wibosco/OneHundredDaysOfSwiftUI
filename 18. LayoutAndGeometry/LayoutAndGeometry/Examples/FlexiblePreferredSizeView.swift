//
//  FlexiblePreferredSizeView.swift
//  LayoutAndGeometry
//
//  Created by William Boles on 17/12/2025.
//

import SwiftUI

struct FlexiblePreferredSizeView: View {
    var body: some View {
        VStack {
            GeometryReader { proxy in
                Text("Hello, World!")
                    .frame(width: proxy.size.width * 0.9, height: 40)
                    .background(.red)
            }
            
            // note how despite the GeometryReader view having a height of 40, it pushes the Text view to the bottom
            
            Text("More text")
                .background(.blue)
        }
    }
}

#Preview {
    FlexiblePreferredSizeView()
}
