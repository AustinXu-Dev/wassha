//
//  wasshaApp.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/25.
//

import SwiftUI

@main
struct wasshaApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var locationVM = LocationViewModel()

    var body: some Scene {
        WindowGroup {
//            ContentView()
//            LocationsView()
//                .environmentObject(locationVM)
            
//            if hasSeenOnboardingView{
//                HomeView()
//            }
//            else{
//                OnboardingView()
//            }
            
//            SplashView()
//            HomeView()
            SplashView()
        }
    }
}
