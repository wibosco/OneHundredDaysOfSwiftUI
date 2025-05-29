//
//  BackToRootDetailView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct BackToRootDetailView: View {
    var number: Int
    @Binding var path: [Int]
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path.removeAll()
                }
            }
    }
}

#Preview {
    @Previewable @State var path = [Int]()
    
    BackToRootDetailView(number: 4, path: $path)
}
