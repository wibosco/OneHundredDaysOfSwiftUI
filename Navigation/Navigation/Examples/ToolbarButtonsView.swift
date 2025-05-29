//
//  ToolbarButtonsView.swift
//  Navigation
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct ToolbarButtonsView: View {
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Tap Me") {
                            // button action here
                        }
                    }
                    
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Or Tap Me") {
                            // button action here
                        }
                    }
                    
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("Tap Me") {
                            
                        }
                        
                        Button("Tap Me 2") {
                            
                        }
                    }
                }
        }
    }
}

#Preview {
    ToolbarButtonsView()
}
