//
//  BackToRootView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct BackToRootView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            BackToRootDetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    BackToRootDetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    BackToRootView()
}
