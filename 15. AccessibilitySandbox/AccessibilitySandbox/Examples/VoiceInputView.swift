//
//  VoiceInputView.swift
//  AccessibilitySandbox
//
//  Created by William Boles on 20/06/2025.
//

import SwiftUI

struct VoiceInputView: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"]) // multiple speech labels to trigger this button
    }
}

#Preview {
    VoiceInputView()
}
