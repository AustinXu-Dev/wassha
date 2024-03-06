//
//  LocationsDataService.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/25.
//

import Foundation
import MapKit

class LocationsDataService{
//    static let locations: [Location] = [
//        Location(name: "Laundry Maid Cafe", coordinates: CLLocationCoordinate2D(latitude: 13.600850834347883, longitude: 100.83578272670958), description: "This is Laundry Maid Cafe", imageName:[ "laundry_maid_cafe"]),
//        Location(name: "WashXpress", coordinates: CLLocationCoordinate2D(latitude: 13.591922250563131, longitude: 100.8312328475825), description: "This is WashXpress", imageName: ["washxpress"]),
//        Location(name: "Family Pro Laundry", coordinates: CLLocationCoordinate2D(latitude: 13.614144836227549, longitude: 100.84795151683518), description: "This is family pro laundry", imageName: ["family_pro_laundry"]),
//    ]
    
    static let locations: [LaundryShopModel] = [
        LaundryShopModel(name: "Laundry Maid Cafe", image: "laundry_1_image", rating: 5, phone: 0642396256, distance: 1.8, coordinates: CLLocationCoordinate2D(latitude: 13.600850834347883, longitude: 100.83578272670958), description: "This is Laundry Maid Cafe", imageName:  ["laundry_maid_cafe"]),
        LaundryShopModel(name: "WashXpress เอแบค​", image: "laundry_2_image", rating: 3.7, phone: 0642396256, distance: 2.9, coordinates: CLLocationCoordinate2D(latitude: 13.591922250563131, longitude: 100.8312328475825), description: "This is WashXpress", imageName: ["washxpress"]),
        LaundryShopModel(name: "Family Pro Laundry​", image: "laundry_3_image", rating: 3.2, phone: 0642396256, distance: 2.3, coordinates: CLLocationCoordinate2D(latitude: 13.614144836227549, longitude: 100.84795151683518), description: "This is family pro laundry", imageName: ["family_pro_laundry"])
    ]
}


