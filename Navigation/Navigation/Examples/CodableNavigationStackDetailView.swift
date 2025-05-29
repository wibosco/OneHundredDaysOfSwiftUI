//
//  CodableNavigationStackDetailView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct CodableNavigationStackDetailView: View {
    var number: Int
    
    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
    }
}

#Preview {
    CodableNavigationStackDetailView(number: 78)
}
