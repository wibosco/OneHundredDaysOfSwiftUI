//
//  TextAlignmentView.swift
//  LayoutAndGeometry
//
//  Created by William Boles on 17/12/2025.
//

import SwiftUI

struct TextAlignmentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Live long and prosper")
                .frame(width: 300, height: 300)
            
            Text("Live long and prosper")
                .frame(width: 300, height: 300, alignment: .topLeading)
        }
    }
}

#Preview {
    TextAlignmentView()
}
