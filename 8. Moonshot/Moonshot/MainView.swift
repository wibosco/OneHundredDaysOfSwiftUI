//
//  MainView.swift
//  Moonshot
//
//  Created by William Boles on 28/05/2025.
//

import SwiftUI

struct MainView: View {
    enum Tabs: Equatable, Hashable {
        case moonshot
        case resizeImages
    }
    
    var body: some View {
        TabView {
            MoonshotView()
                .tabItem {
                    Label("Moonshot", systemImage: "moon.circle")
                }
            
            GridView()
                .tabItem {
                    Label("Grid", systemImage: "square.grid.3x3")
                }
            
            CodingView()
                .tabItem {
                    Label("Coding", systemImage: "barcode")
                }
            
            NavigationView()
                .tabItem {
                    Label("Navigation", systemImage: "move.3d")
                }
            
            ScrollingView()
                .tabItem {
                    Label("Scrolling", systemImage: "scroll")
                }
                
            ResizingImagesView()
                .tabItem {
                    Label("Resize", systemImage: "photo.artframe")
                }
        }
    }
}

#Preview {
    MainView()
}
