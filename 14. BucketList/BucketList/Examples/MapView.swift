//
//  MapView.swift
//  BucketList
//
//  Created by William Boles on 12/06/2025.
//

import SwiftUI
import MapKit

extension MapCameraPosition {
    static let paris = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    static let tokyo = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    
    static let london =  MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
}

struct MapView: View {
    @State var position = MapCameraPosition.london

    var body: some View {
        VStack {
            Map(position: $position)
                .mapStyle(.hybrid)
                .onMapCameraChange { context in
                    print(context.region)
                }
            
            HStack(spacing: 50) {
                Button("London") {
                    position = MapCameraPosition.london
                }
                
                Button("Paris") {
                    position = MapCameraPosition.paris
                }
                
                Button("Tokyo") {
                    position = MapCameraPosition.tokyo
                }
            }
            .padding()
        }
    }
}

#Preview {
    MapView()
}
