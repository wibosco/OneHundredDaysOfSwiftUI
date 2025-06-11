//
//  ShareLinkView.swift
//  Instafilter
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI

struct ShareLinkView: View {
    var body: some View {
        VStack(spacing: 18) {
            ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
                Label("Spread the word about Swift", systemImage: "swift")
            }
            
            let example = Image(.example)

            ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
                Label("Click to share", systemImage: "airplane")
            }
        }
    }
}

#Preview {
    ShareLinkView()
}
