//
//  CodableNavigationStackView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        guard let data = try? Data(contentsOf: savePath),
              let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) else {
            path = NavigationPath()
            return
        }
        
        path = NavigationPath(decoded)
    }
    
    func save() {
        guard let representation = path.codable else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

struct CodableNavigationStackView: View {
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            CodableNavigationStackDetailView(number: 0)
                .navigationDestination(for: Int.self) { i in
                    CodableNavigationStackDetailView(number: i)
                }
        }
    }
}

#Preview {
    CodableNavigationStackView()
}
