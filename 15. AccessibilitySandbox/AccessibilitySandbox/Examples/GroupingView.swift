//
//  GroupingView.swift
//  AccessibilitySandbox
//
//  Created by William Boles on 18/06/2025.
//

import SwiftUI

struct GroupingView: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                Image(decorative: "character") // ignored
                
                Image(.character)
                    .accessibilityHidden(true) // ignored
                
                VStack {
                    Text("Your score is")
                    Text("1000")
                        .font(.title)
                } // will be read as two seperate text views
                
                VStack {
                    Text("Your score is")
                    Text("1000")
                        .font(.title)
                }
                .accessibilityElement(children: .combine) // both text views to be read together, with a short pause between them
                
                VStack {
                    Text("Your score is")
                    Text("1000")
                        .font(.title)
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel("Your score is 1000") // spoken without pause
            }
        }
    }
}

#Preview {
    GroupingView()
}
