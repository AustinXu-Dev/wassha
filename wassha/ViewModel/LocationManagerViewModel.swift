//
//  LocationManagerViewModel.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

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

