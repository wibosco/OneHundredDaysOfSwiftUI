//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by William Boles on 10/06/2025.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
