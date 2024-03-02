//
//  SearchbarLocationModel.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/3.
//

import Foundation

enum ViewType{
    case searchView
    case currentLocation
    case locateOnMap
}

struct SearchbarLocationModel: Identifiable{
    var id = UUID().uuidString
    var name: String
    var imageName: String
    var destinationValue: ViewType
}

let locationsBar = [
    SearchbarLocationModel(name: "Use current location", imageName: "location", destinationValue: .currentLocation),
    SearchbarLocationModel(name: "Locate on Map", imageName: "map", destinationValue: .locateOnMap)
]
