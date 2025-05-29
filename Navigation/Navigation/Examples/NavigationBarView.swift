//
//  NavigationBarView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
        }
    }
}

#Preview {
    NavigationBarView()
}
