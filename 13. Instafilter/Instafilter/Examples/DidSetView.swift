//
//  PropertyWrappersView.swift
//  Instafilter
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI

struct DidSetView: View {
    @State private var blurAmount = 0.0 {
        didSet {
            //won't be called when the binding is updated as the struct wrapping blurAmount doesn't change
            //but will becalled when the button directly changes it
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
        .padding()
    }
}

#Preview {
    DidSetView()
}
