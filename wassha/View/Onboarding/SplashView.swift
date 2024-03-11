//
//  SplashView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    @AppStorage(Constants.currentOnboardingVersion) private var hasSeenOnboardingView = false
    @AppStorage("isSignIn") var isSignIn = false

    
    var body: some View {
        ZStack {
            if self.isActive {
                if hasSeenOnboardingView{
//                    SignInView()
                    if isSignIn{
                        BaseTabView()
                    } else {
                        SignInView()
                    }
                }else{
                    OnboardingView()
                }
            } else {
                Image("onboarding_home")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}


#Preview {
    SplashView()
}
