//
//  LocationViewModel.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import Foundation
import MapKit
import SwiftUI

class LocationViewModel: ObservableObject{
    
    // All locations
    @Published var locations: [LaundryShopModel]
    
    // Current location
    @Published var mapLocation: LaundryShopModel{
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
    
    private func updateMapRegion(location: LaundryShopModel){
        withAnimation(.easeInOut){
            mapRegion = .region(MKCoordinateRegion(center: location.coordinates, span: mapSpan))
        }
    }
    
    func toggleLocationList() {
        withAnimation(.easeInOut){
            showLocationList.toggle()
        }
    }
    
    func showNextLocation(location: LaundryShopModel) {
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
