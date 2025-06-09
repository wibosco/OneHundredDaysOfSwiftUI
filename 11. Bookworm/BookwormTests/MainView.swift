//
//  MainView.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            BookwormView()
                .tabItem {
                    Label("Bookworm", systemImage: "books.vertical")
                }
            
            SwiftDataView()
                .tabItem {
                    Label("SwiftData", systemImage: "swift")
                }
            
            TextFieldEditorView()
                .tabItem {
                    Label("Field", systemImage: "doc.text.image")
                }
            
            TextEditorView()
                .tabItem {
                    Label("Editor", systemImage: "doc.richtext")
                }
            
            BindingView()
                .tabItem {
                    Label("Binding", systemImage: "arrow.left.arrow.right")
                }
        }
    }
}

#Preview {
    MainView()
}
