//
//  MainView.swift
//  iExpense
//
//  Created by William Boles on 27/05/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            iExpenseView()
                .tabItem {
                    Label("Main", systemImage: "number.circle")
                }
            
            AppStorageView()
                .tabItem {
                    Label("User Defaults", systemImage: "person.circle")
                }
            
            OnDeleteView()
                .tabItem {
                    Label("On Delete", systemImage: "delete.left")
                }
            
            ObservableView()
                .tabItem {
                    Label("Observable View", systemImage: "eye")
                }
            
            ShowingSheetView()
                .tabItem {
                    Label("Sheet", systemImage: "newspaper")
                }
        }
    }
}

#Preview {
    MainView()
}
