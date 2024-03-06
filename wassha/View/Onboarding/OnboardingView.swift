//
//  OnboardingView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var currentTab = 0
    @AppStorage(Constants.currentOnboardingVersion) private var hasSeenOnboardingView = false
    
    var body: some View {

        TabView(selection: $currentTab,
                content:  {
            OnboardingOneView(currentTab: $currentTab).tag(0)
            OnboardingTwoView(currentTab: $currentTab).tag(1)
            OnboardingThreeView(currentTab: $currentTab).tag(2)
            
        }).ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())

    }
}

#Preview {
    OnboardingView()
}
