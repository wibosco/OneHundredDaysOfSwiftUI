//
//  SingleSelectionView.swift
//  HotProspects
//
//  Created by William Boles on 08/07/2025.
//

import SwiftUI

struct SingleSelectionView: View {
    @State private var selection: String?
    
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if let selection {
            Text("Your selection \(selection)")
        }
    }
}

#Preview {
    SingleSelectionView()
}
