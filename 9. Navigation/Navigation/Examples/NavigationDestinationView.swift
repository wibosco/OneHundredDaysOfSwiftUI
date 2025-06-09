//
//  NavigationDestination.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct NavigationDestinationView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                NavigationLink("Select \(i)", value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                LinkCreationDetailView(number: selection)
//                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    NavigationDestinationView()
}
