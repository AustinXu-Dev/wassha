//
//  LocationsDataService.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/25.
//

import Foundation
import MapKit

class LocationsDataService{
    static let locations: [Location] = [
        Location(name: "Laundry Maid Cafe", coordinates: CLLocationCoordinate2D(latitude: 13.600850834347883, longitude: 100.83578272670958), description: "This is Laundry Maid Cafe", imageName:[ "laundry_maid_cafe"]),
        Location(name: "WashXpress", coordinates: CLLocationCoordinate2D(latitude: 13.591922250563131, longitude: 100.8312328475825), description: "This is WashXpress", imageName: ["washxpress"]),
        Location(name: "Family Pro Laundry", coordinates: CLLocationCoordinate2D(latitude: 13.614144836227549, longitude: 100.84795151683518), description: "This is family pro laundry", imageName: ["family_pro_laundry"]),
    ]
}
