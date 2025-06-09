//
//  LinkCreationView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct LinkCreationView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                LinkCreationDetailView(number: 556)
            }
        }
    }
}

#Preview {
    LinkCreationView()
}
