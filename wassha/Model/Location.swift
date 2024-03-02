//
//  Location.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/25.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable{
    let id = UUID().uuidString
    let name: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageName: [String]
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
