//
//  TextEditorView.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import SwiftUI

struct TextEditorView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    TextEditorView()
}
