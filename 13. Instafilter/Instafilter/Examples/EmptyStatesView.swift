//
//  EmptyStatesView.swift
//  Instafilter
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI

struct EmptyStatesView: View {
    var body: some View {
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    EmptyStatesView()
}
