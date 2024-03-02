<<<<<<< HEAD
import Foundation
import Observation
import CoreLocation
@Observable class LocationManagerViewModel:NSObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    var userAddress: String? = ""
    
    override init() {
        super.init()
    
        locationManager.delegate = self
    
        }
    
    func requestLocation(){
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        locationManager.startUpdatingLocation()
        geocoder.reverseGeocodeLocation(lastLocation) { (placemarks, error) in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?.first {
                let locality = placemark.locality ?? "Not Found"
                            let thoroughfare = placemark.thoroughfare ?? "Not Found"
                            let subThoroughfare = placemark.subThoroughfare ?? "Not Found"
                            let detailedAddress = "\(locality), \(thoroughfare) \(subThoroughfare)"
                            // Use locality, thoroughfare, or subThoroughfare as needed
                            self.userAddress = detailedAddress // Or use individual
                
                
                
            }
        }
        
        
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
}

=======
//
//  LocationViewModel.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/25.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject{
    
    // All locations
    @Published var locations: [Location]
    
    // Current location
    @Published var mapLocation: Location{
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MapCameraPosition = .automatic
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    
    // Show list of locations
    @Published var showLocationList: Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location){
        withAnimation(.easeInOut){
            mapRegion = .region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut){
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed(){
        // Get the current index
//        let currentIndex = locations.firstIndex { location in
//            return location == mapLocation
//        }
        
        // Same code as above
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {
            print("Could not find current index in location array! Should never happen.")
            return
        }
        
        
        // Check if the current index is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            
            // Next index is not valid
            // Restart from 0
            guard let firstLocation = locations.first else {return}
            showNextLocation(location: firstLocation)
            return
        }
        
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
        
    }
}
>>>>>>> 40d09ca (Create map with custom location and pin, Animate and change to another location)
