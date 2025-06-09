//
//  TextFieldEditorView.swift
//  Bookworm
//
//  Created by William Boles on 09/06/2025.
//

import SwiftUI

struct TextFieldEditorView: View {
    @AppStorage("notes2") private var notes = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter your text", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Notes")
                    .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    TextFieldEditorView()
}
