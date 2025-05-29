//
//  Astronaut.swift
//  Moonshot
//
//  Created by William Boles on 28/05/2025.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    
    var imageName: String {
        return id
    }
}
