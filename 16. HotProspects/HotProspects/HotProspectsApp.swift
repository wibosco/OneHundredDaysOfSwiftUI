//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by William Boles on 08/07/2025.
//

import SwiftUI
import SwiftData

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            HotProspectsView()
        }
        .modelContainer(for: Prospect.self)
    }
}
