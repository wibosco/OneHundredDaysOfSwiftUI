//
//  GeometryReaderView.swift
//  LayoutAndGeometry
//
//  Created by William Boles on 17/12/2025.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        GeometryReader { proxy in
            Image(.example)
                .resizable()
                .scaledToFit()
                .frame(width: proxy.size.width * 0.8, height: 300)
                .frame(width: proxy.size.width, height: proxy.size.height)
        }
    }
}

#Preview {
    GeometryReaderView()
}
