//
//  HStackAlignmentView.swift
//  LayoutAndGeometry
//
//  Created by William Boles on 17/12/2025.
//

import SwiftUI

struct HStackAlignmentView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            
            HStack(alignment: .bottom) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            
            HStack(alignment: .lastTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    HStackAlignmentView()
}
