//
//  MainView.swift
//  BucketList
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BucketListView()
                .tabItem {
                    Label("BucketList", systemImage: "list.number")
                }
            
            AuthenticationView()
                .tabItem {
                    Label("Authentication", systemImage: "key.viewfinder")
                }
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            EnumView()
                .tabItem {
                    Label("Enum", systemImage: "tree")
                }
            
            WritingToDocumentsView()
                .tabItem {
                    Label("Writing", systemImage: "pencil.line")
                }
            
            ComparableView()
                .tabItem {
                    Label("Comparable", systemImage: "magnifyingglass.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
