//
//  MainView.swift
//  Flashzilla
//
//  Created by William Boles on 11/07/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            TimerView()
                .tabItem {
                    Label("Timer", systemImage: "clock")
                }
            
            SpacerTapView()
                .tabItem {
                    Label("Spacer", systemImage: "space")
                }
            
            HitTestingView()
                .tabItem {
                    Label("Hit", systemImage: "hand.tap")
                }
            
            GestureSequencingView()
                .tabItem {
                    Label("Sequencing", systemImage: "list.number")
                }
            
            RotateGestureView()
                .tabItem {
                    Label("Rotation", systemImage: "crop.rotate")
                }
            
            MagnifyGestureView()
                .tabItem {
                    Label("Magnify", systemImage: "magnifyingglass")
                }
            
            GesturesView()
                .tabItem {
                    Label("Gestures", systemImage: "move.3d")
                }
        }
    }
}

#Preview {
    MainView()
}
