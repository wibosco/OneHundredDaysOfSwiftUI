//
//  ImageInterpolationView.swift
//  HotProspects
//
//  Created by William Boles on 08/07/2025.
//

import SwiftUI

struct ImageInterpolationView: View {
    var body: some View {
        Image(.example)
            .interpolation(.none) // scales up with sharp edges
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolationView()
}
