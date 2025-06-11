//
//  LoadingPhotosView.swift
//  Instafilter
//
//  Created by William Boles on 11/06/2025.
//

import PhotosUI
import SwiftUI

struct LoadingPhotosView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            selectedImage?
                .resizable()
                .scaledToFit()
            
            PhotosPicker(selection: $pickerItem, matching: .images) {
                Label("Select a picture", systemImage: "photo")
            }
        }
        .onChange(of: pickerItem) { oldValue, newValue in
            Task {
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

#Preview {
    LoadingPhotosView()
}
