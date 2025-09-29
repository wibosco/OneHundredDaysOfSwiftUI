//
//  HitTestingView.swift
//  Flashzilla
//
//  Created by William Boles on 11/07/2025.
//

import SwiftUI

struct HitTestingView: View {
    var body: some View {
        VStack(spacing: 50) {
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        // despite the circle being the same size as the rectangle and that circle being placed directly on
                        // top of the rectangle, tapping the transparent parts of the circle view will trigger this print
                        // statement
                        print("Rectangle tapped!")
                    }
                
                Circle()
                    .fill(.red)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Circle tapped!")
                    }
            }
            
            ZStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped!")
                    }
                
                Circle()
                    .fill(.red)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Circle tapped!")
                    }
                    // is no longer tapable
                    .allowsHitTesting(false)
            }
        }
    }
}

#Preview {
    HitTestingView()
}
