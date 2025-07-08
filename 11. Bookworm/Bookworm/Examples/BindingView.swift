//
//  BindingView.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import SwiftUI

struct BindingView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            PushButtonView(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

#Preview {
    BindingView()
}
