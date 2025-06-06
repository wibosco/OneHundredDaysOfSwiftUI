//
//  AsyncImageView.swift
//  CupcakeCorner
//
//  Created by William Boles on 29/05/2025.
//

import SwiftUI

struct AsyncImageView: View {
    var body: some View {
        VStack(spacing: 15) {
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
                    image
                        .resizable()
                        .scaledToFit()

            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            
            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                } else if phase.error != nil {
                    Text("There was an error loading the image")
                } else {
                    ProgressView()
                }
            }
            .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    AsyncImageView()
}
