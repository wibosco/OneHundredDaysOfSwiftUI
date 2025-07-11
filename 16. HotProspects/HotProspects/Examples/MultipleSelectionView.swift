//
//  MultipleSelectionView.swift
//  HotProspects
//
//  Created by William Boles on 08/07/2025.
//

import SwiftUI

struct MultipleSelectionView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    
    @State private var selection = Set<String>()
    
    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if selection.isEmpty == false {
            Text("You selected \(selection.formatted())")
        }
        
        EditButton()
    }
}

#Preview {
    MultipleSelectionView()
}
