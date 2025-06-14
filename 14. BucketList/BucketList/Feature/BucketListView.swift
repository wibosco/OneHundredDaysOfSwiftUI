//
//  BucketListView.swift
//  BucketList
//
//  Created by William Boles on 11/06/2025.
//

import SwiftUI
import MapKit

struct BucketListView: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var viewModel = BucketListViewModel()
    
    var body: some View {
        Group {
            if viewModel.isUnlocked {
                ZStack {
                    MapReader { proxy in
                        Map(initialPosition: startPosition) {
                            ForEach(viewModel.locations) { location in
                                Annotation(location.name, coordinate: location.coordinate) {
                                    Image(systemName: "star.circle")
                                        .resizable()
                                        .foregroundStyle(.red)
                                        .frame(width: 44, height: 44)
                                        .background(.white)
                                        .clipShape(.circle)
                                        .onLongPressGesture(minimumDuration: 0.1) { //minimumDuration needed for iOS18
                                            viewModel.selectedPlace = location
                                        }
                                }
                            }
                        }
                        .mapStyle(viewModel.mapStyle())
                            .onTapGesture { position in
                                if let coordinate = proxy.convert(position, from: .local) {
                                    viewModel.addLocation(at: coordinate)
                                }
                            }
                            .sheet(item: $viewModel.selectedPlace) { place in
                                EditView(location: place) {
                                    viewModel.update(location: $0)
                                }
                            }
                    }
                    
                    Button("Mode") {
                        viewModel.hybirdMapStyle.toggle()
                    }
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect)
                    .position(x: 50, y: 10)
                }
            } else {
                Button("Unlock Places", action: viewModel.authenticate)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
            }
        }
        .alert(viewModel.errorMessage ?? "Unknown error", isPresented: $viewModel.showError) {
            Button("OK") { }
        }
    }
}

#Preview {
    BucketListView()
}
