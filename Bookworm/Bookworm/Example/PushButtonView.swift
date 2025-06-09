//
//  PushButtonView.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import SwiftUI

struct PushButtonView: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

#Preview {
    @Previewable @State var isOn = true
    
    PushButtonView(title: "Example", isOn: $isOn)
}
