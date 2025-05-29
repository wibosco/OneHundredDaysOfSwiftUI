//
//  ScrollingView.swift
//  Moonshot
//
//  Created by William Boles on 28/05/2025.
//

import SwiftUI
import OSLog

struct ScrollingView: View {
    var body: some View {
        ScrollView {
            LazyVStack (spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct CustomText: View {
    let logger = Logger(subsystem: "com.williamboles",
                        category: "UI")
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        logger.info("Creating a new CustomText: \(text)")
        self.text = text
    }
}

#Preview {
    ScrollingView()
}
