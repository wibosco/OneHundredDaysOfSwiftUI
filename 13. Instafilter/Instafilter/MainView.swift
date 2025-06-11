//
//  MainView.swift
//  Instafilter
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            InstafilterView()
                .tabItem {
                    Label("Instafilter", systemImage: "camera.macro")
                }
            
            AppStoreReviewView()
                .tabItem {
                    Label("Review", systemImage: "info.bubble")
                }
            
            ShareLinkView()
                .tabItem {
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            
            LoadingPhotosView()
                .tabItem {
                    Label("Photos", systemImage: "photo.on.rectangle.angled")
                }
            
            EmptyStatesView()
                .tabItem {
                    Label("Empty", systemImage: "clear")
                }
            
            CoreImageView()
                .tabItem {
                    Label("CoreImage", systemImage: "photo")
                }
            
            ConfirmationDialogsView()
                .tabItem {
                    Label("Dialog", systemImage: "person.line.dotted.person")
                }
            
            OnChangeView()
                .tabItem {
                    Label("onChange", systemImage: "arrow.up.left.and.down.right.and.arrow.up.right.and.down.left")
                }
            
            DidSetView()
                .tabItem {
                    Label("didSet", systemImage: "square.inset.filled")
                }
        }
    }
}

#Preview {
    MainView()
}
