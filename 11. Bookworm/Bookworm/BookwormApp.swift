//
//  BookwormApp.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(for: Book.self)
//        .modelContainer(for: Student.self) //needed for the SwiftDataView example
    }
}
