//
//  ServiceSelectionViewModel.swift
//  wassha
//
//  Created by Swan Nay Phue Aung on 12/03/2024.
//

import Foundation
class ServiceSelectionViewModel: ObservableObject {
    @Published var selectedServices:[String] = []
    static let shared = ServiceSelectionViewModel()

    private init(){ 
        
    }
    
    
    
    func updateSelectedClothes(serviceTypes: [ServiceType]) {
        selectedServices = serviceTypes
            .filter { $0.isSelected }
            .map { $0.serviceType }
    }
}

