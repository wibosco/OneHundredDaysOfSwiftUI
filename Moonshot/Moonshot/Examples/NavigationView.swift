//
//  NavigationView.swift
//  Moonshot
//
//  Created by William Boles on 28/05/2025.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { row in
                NavigationLink("Row: \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    NavigationView()
}
