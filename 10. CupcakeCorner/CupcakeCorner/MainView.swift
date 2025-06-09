//
//  MainView.swift
//  CupcakeCorner
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CupcakeCornerView()
                .tabItem {
                    Label("Corner", systemImage: "birthday.cake")
                }
            
            HapticView()
                .tabItem {
                    Label("Haptic", systemImage: "scribble")
                }
            
            CodableObservable()
                .tabItem {
                    Label("Diabling", systemImage: "eye")
                }
            
            ValidatingAndDisablingFormsView()
                .tabItem {
                    Label("Diabling", systemImage: "lightswitch.off")
                }
            
            AsyncImageView()
                .tabItem {
                    Label("AsyncImage", systemImage: "photo")
                }
            
            DownloadView()
                .tabItem {
                    Label("Download", systemImage: "square.and.arrow.down")
                }
        }
    }
}

#Preview {
    MainView()
}
