//
//  OnChangeView.swift
//  Instafilter
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI

struct OnChangeView: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)

            Slider(value: $blurAmount, in: 0...20)
                //use instead of `didSet` to be informed when property has changed
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is \(newValue)")
                }
        }
        .padding()
    }
}

#Preview {
    OnChangeView()
}
