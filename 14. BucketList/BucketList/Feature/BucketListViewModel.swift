//
//  BucketListViewModel.swift
//  BucketList
//
//  Created by William Boles on 12/06/2025.
//

import Foundation
import SwiftUI
import CoreLocation
import LocalAuthentication
import MapKit

@Observable
class BucketListViewModel {
    private(set) var locations: [Location]
    var selectedPlace: Location?
    
    let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
    
    var isUnlocked = false
    
    var hybirdMapStyle: Bool = true
    
    var errorMessage: String?
    var showError = false
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            locations = try JSONDecoder().decode([Location].self, from: data)
        } catch {
            locations = []
        }
    }
    
    func mapStyle() -> MapStyle {
        if hybirdMapStyle {
            return .hybrid
        } else {
            return .standard
        }
    }
    
    func addLocation(at point: CLLocationCoordinate2D) {
        let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
        locations.append(newLocation)
        
        save()
    }
    
    func update(location: Location) {
        guard let selectedPlace else { return }
        
        if let index = locations.firstIndex(of: selectedPlace) { //find the old location and replace it with the new location
            locations[index] = location
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(locations)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    self.isUnlocked = true
                } else {
                    self.errorMessage = "Biometrics authentication failed"
                    self.showError = true
                }
            }
        } else {
            errorMessage = "Biometrics authentication not supported"
            showError = true
        }
    }
}
