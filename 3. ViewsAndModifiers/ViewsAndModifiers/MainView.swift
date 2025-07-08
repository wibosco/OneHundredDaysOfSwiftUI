//
//  MainView.swift
//  ViewsAndModifiers
//
//  Created by William Boles on 22/05/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            WeSplitView()
                .tabItem {
                    Label("WeSplit", systemImage: "dollarsign.circle")
                }
            
            GuessTheFlagView()
                .tabItem {
                    Label("GuessTheFlag", systemImage: "flag.filled.and.flag.crossed")
                }
        }
    }
}

#Preview {
    MainView()
}
