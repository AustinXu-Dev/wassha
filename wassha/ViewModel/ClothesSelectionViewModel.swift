//
//  ClothesSelectionViewModel.swift
//  wassha
//
//  Created by Swan Nay Phue Aung on 10/03/2024.
//

import Foundation
class ClothesSelectionViewModel: ObservableObject {
    @Published var selectedClothes: [[String: [String: Int]]] = []
        
    
    func updateSelectedClothes(clothesTypes: [ClothesType]) {
        selectedClothes = clothesTypes.reduce(into: []) { result, type in
            if type.isSelected {
                if type.clothesType == "Cotton" {
                    result.append(contentsOf: [[type.clothesType: ["dress": 0,"shirt": 0]]])
                } else {
                    result.append(contentsOf: [[type.clothesType: ["trousers": 0,"dress": 0]]])
                }
            }
        }
        
        
    }
}
