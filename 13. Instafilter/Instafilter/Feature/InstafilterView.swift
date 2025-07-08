//
//  ContentView.swift
//  Instafilter
//
//  Created by William Boles on 11/06/2025.
//

import PhotosUI
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

extension CIFilter {
    var supportsIntensityChanges: Bool {
        inputKeys.contains(kCIInputIntensityKey)
    }
    
    var supportsRadiusChanges: Bool {
        inputKeys.contains(kCIInputRadiusKey)
    }
    
    var supportsScaleChanges: Bool {
        inputKeys.contains(kCIInputScaleKey)
    }
}

struct InstafilterView: View {
    @State private var processedImage: Image?
    @State private var filterValue = 0.5
    
    @State private var selectedItem: PhotosPickerItem?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilters = false
    
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .onChange(of: selectedItem, loadImage)
                
                Spacer()
                
                if let change = filterChangeLabel() {
                    HStack {
                        Text(change)
                            .opacity(selectedItem == nil ? 0.3 : 1.0) // Fade out when disabled
                        Slider(value: $filterValue)
                            .onChange(of: filterValue, applyProcessing)
                    }
                    .padding(.vertical)
                    .disabled(selectedItem == nil)
                }
                
                HStack {
                    Button("Change Filter", action: changeFilter)
                    
                    Spacer()
                    
                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
                .disabled(selectedItem == nil)
            }
        }
        .padding([.horizontal, .bottom])
        .navigationTitle("Instafilter")
        .confirmationDialog("Select a filter", isPresented: $showingFilters) {
            Button("Crystallize") {
                setFilter(CIFilter.crystallize())
            }
            Button("Edges") {
                setFilter(CIFilter.edges())
            }
            Button("Gaussian Blur") {
                setFilter(CIFilter.gaussianBlur())
            }
            Button("Pixellate") {
                setFilter(CIFilter.pixellate())
            }
            Button("Sepia Tone") {
                setFilter(CIFilter.sepiaTone())
            }
            Button("Unsharp Mask") {
                setFilter(CIFilter.unsharpMask())
            }
            Button("Vignette") {
                setFilter(CIFilter.vignette())
            }
            Button("Cancel", role: .cancel) { }
        }
    }
    
    func filterChangeLabel() -> String? {
        if currentFilter.supportsIntensityChanges {
            return "Intensity"
        } else if currentFilter.supportsRadiusChanges {
            return "Radius"
        } else if currentFilter.supportsScaleChanges {
            return "Scale"
        }
        
        return nil
    }
    
    func changeFilter() {
        showingFilters = true
    }
    
    func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else {
                return
            }
            
            guard let inputImage = UIImage(data: imageData) else {
                return
            }
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        //different filter have different keys, need to check first before attempting to set
        if currentFilter.supportsIntensityChanges {
            currentFilter.setValue(filterValue, forKey: kCIInputIntensityKey)
        }
        
        if currentFilter.supportsRadiusChanges {
            currentFilter.setValue(filterValue * 200, forKey: kCIInputRadiusKey)
        }
        
        if currentFilter.supportsScaleChanges {
            currentFilter.setValue(filterValue * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return
        }
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
    
    @MainActor
    func setFilter(_ filter: CIFilter) {
        filterCount += 1
        
        if filterCount >= 20 {
            requestReview()
        }
        
        currentFilter = filter
        loadImage()
    }
}

#Preview {
    InstafilterView()
}
