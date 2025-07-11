//
//  WritingToDocumentsView.swift
//  BucketList
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI

struct WritingToDocumentsView: View {
    var body: some View {
        Button("Read and Write") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url, encoding: .utf8)
                
                print(input)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    WritingToDocumentsView()
}
