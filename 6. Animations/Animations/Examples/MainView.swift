//
//  MainView.swift
//  Animations
//
//  Created by William Boles on 26/05/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TapAnimationView()
                .tabItem {
                    Label("Tap", systemImage: "hand.tap")
                }
            
            PulseAnimationView()
                .tabItem {
                    Label("Pulse", systemImage: "dot.radiowaves.left.and.right")
                }
            
            DragBoxView()
                .tabItem {
                    Label("Drag Box", systemImage: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
                }
            
            SnakeTextDragView()
                .tabItem {
                    Label("Snake", systemImage: "hand.draw")
                }
            
            MultipleAnimationsView()
                .tabItem {
                    Label("Multiple Animations", systemImage: "list.number")
                }
            
            AsymmetricTransitionView()
                .tabItem {
                    Label("Asymmetric Transition", systemImage: "eye.slash")
                }
            
            CornerRotateTransitionView()
                .tabItem {
                    Label("Corner Rotate Transition", systemImage: "crop.rotate")
                }
            
            GuessTheFlagView()
                .tabItem {
                    Label("Guess The Flag", systemImage: "flag.filled.and.flag.crossed")
                }
        }
    }
}

#Preview {
    MainView()
}
