//
//  DetailView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct LinkCreationDetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        
        //this will be called not when this instance of DetailView is pushed on but when the navigation link
        //is created
        print("Creating detail view \(number)")
    }
}

#Preview {
    LinkCreationDetailView(number: 7)
}
