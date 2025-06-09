//
//  ShowingSheetView.swift
//  iExpense
//
//  Created by William Boles on 27/05/2025.
//

import SwiftUI

struct ShowingSheetView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SheetView(name: "Tommy")
        }
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Hello, \(name)")
            Button("Dismiss", role: .destructive) {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ShowingSheetView()
}
