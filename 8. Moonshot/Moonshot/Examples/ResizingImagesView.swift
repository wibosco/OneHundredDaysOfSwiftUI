//
//  ResizingImagesView.swift
//  Moonshot
//
//  Created by William Boles on 28/05/2025.
//

import SwiftUI

struct ResizingImagesView: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFill()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
            .clipped()
    }
}

#Preview {
    ResizingImagesView()
}
