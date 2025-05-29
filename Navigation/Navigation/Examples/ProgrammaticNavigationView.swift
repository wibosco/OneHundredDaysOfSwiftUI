//
//  ProgrammaticNavigation.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct ProgrammaticNavigationView: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 15) {
                Button("Show 32") {
                    path = [32]
                }
                
                Button("Show 64") {
                    path.append(64)
                }
                
                Button("Show 32 then 64") {
                    //will cause two views to be pushed onto the navigation stack
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ProgrammaticNavigationView()
}
