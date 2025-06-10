//
//  MainView.swift
//  SwiftDataProject
//
//  Created by William Boles on 10/06/2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            iExpenseView()
                .tabItem {
                    Label("iExpense", systemImage: "number.circle")
                }
            
            RelationshipsView()
                .tabItem {
                    Label("Relationships", systemImage: "person.2")
                }
            
            DynamicallySortingAndFiltering()
                .tabItem {
                    Label("Dynamic", systemImage: "checklist.unchecked")
                }
            
            PredicateView()
                .tabItem {
                    Label("Predicate", systemImage: "camera.filters")
                }
            
            UserView()
                .tabItem {
                    Label("Editing", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
