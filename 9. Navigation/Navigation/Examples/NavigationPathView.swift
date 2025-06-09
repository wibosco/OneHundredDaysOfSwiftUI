//
//  NavigationPathView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct NavigationPathView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(0..<100) { num in
                Text("Value: \(num)")
            }
            .navigationTitle("Path")
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
        }
    }
}

#Preview {
    NavigationPathView()
}
