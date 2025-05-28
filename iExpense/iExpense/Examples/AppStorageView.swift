//
//  AppStorageView.swift
//  iExpense
//
//  Created by William Boles on 27/05/2025.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    AppStorageView()
}
