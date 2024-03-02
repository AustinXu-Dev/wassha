//
//  wasshaApp.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/25.
//

import SwiftUI

@main
struct wasshaApp: App {
    
    @StateObject private var locationVM = LocationViewModel()
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LocationsView()
                .environmentObject(locationVM)
        }
    }
}
