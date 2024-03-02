//
//  OnboardingThreeView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct OnboardingThreeView: View {
    @AppStorage(Constants.currentOnboardingVersion) private var hasSeenOnboardingView = false

    @Binding var currentTab: Int

    var body: some View {
        ZStack{
            Image("onboarding_image_3")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(alignment: .center){
                Text("\"Refreshingly \nConvenient \nLaundry \nService, \nTailored for \nYour Lifestyle\"")
                    .font(.system(size: 32,weight: .semibold))
                    .lineLimit(6)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .shadow(color: .gray, radius: 2, y:4)
                Spacer()
                HStack{
                    Button {
                        hasSeenOnboardingView = true
                    } label: {
                        Text("Next")
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer()
                    
                    Button {
                        hasSeenOnboardingView = true
                    } label: {
                        Text("Skip")
                    }
                    .buttonStyle(.borderedProminent)
                    
                }.padding(.horizontal, 30)
            }
            .frame(maxWidth: 400, maxHeight: 750)
        }
    }
}

#Preview {
    OnboardingThreeView(currentTab: .constant(0))
}
