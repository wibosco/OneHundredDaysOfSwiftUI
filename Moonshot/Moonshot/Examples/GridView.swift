//
//  GridView.swift
//  Moonshot
//
//  Created by William Boles on 28/05/2025.
//

import SwiftUI

struct GridView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout, spacing: 4) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
                .background(.red)
            }
        }
    }
}

#Preview {
    GridView()
}
