//
//  MainView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MoonshotView()
                .tabItem {
                    Label("Moonshot", systemImage: "moon.circle")
                }
            
            ExpenseView()
                .tabItem {
                    Label("iExpense", systemImage: "dollarsign.circle")
                }
            
            EditableTitleView()
                .tabItem {
                    Label("Editable", systemImage: "pencil")
                }
            
            ToolbarButtonsView()
                .tabItem {
                    Label("Placement", systemImage: "arrow.left.arrow.right")
                }
            
            NavigationBarView()
                .tabItem {
                    Label("Bar", systemImage: "menubar.arrow.up.rectangle")
                }
            
            CodableNavigationStackView()
                .tabItem {
                    Label("Codable", systemImage: "square.and.arrow.down")
                }
            
            BackToRootView()
                .tabItem {
                    Label("Back to Root", systemImage: "backward.end.fill")
                }
            
            NavigationPathView()
                .tabItem {
                    Label("Path", systemImage: "arrow.rectanglepath")
                }
            
            ProgrammaticNavigationView()
                .tabItem {
                    Label("Programmatic", systemImage: "button.programmable.square.fill")
                }
            
            NavigationDestinationView()
                .tabItem {
                    Label("Destination", systemImage: "pedestrian.gate.open")
                }
            
            LinkCreationView()
                .tabItem {
                    Label("Link", systemImage: "doc.text.below.ecg")
                }
        }
    }
}

#Preview {
    MainView()
}
