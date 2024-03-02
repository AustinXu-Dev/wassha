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
    @AppStorage(Constants.currentOnboardingVersion) private var hasSeenOnboardingView = false

    var body: some Scene {
        WindowGroup {
//            ContentView()
//            LocationsView()
//                .environmentObject(locationVM)
            
            if hasSeenOnboardingView{
                HomeView()
            }
            else{
                SignInView()
            }
        }
    }
}
