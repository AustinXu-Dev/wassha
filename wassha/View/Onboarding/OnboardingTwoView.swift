//
//  OnboardingTwoView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct OnboardingTwoView: View {
    @AppStorage(Constants.currentOnboardingVersion) private var hasSeenOnboardingView = false

    @Binding var currentTab: Int

    var body: some View {
        ZStack{
            Image("onboarding_image_2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack(alignment: .center){
                Spacer()
                Text("Happy Relief \nEvery Laundry Day")
                    .font(.system(size: 36,weight: .semibold))
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.white)
                    .shadow(color: .gray, radius: 2, y:4)
                Spacer().frame(height: 120)
                HStack{
                    Button {
                        withAnimation(.easeInOut){
                            if currentTab == 1{
                                currentTab += 1
                            }
                        }
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
    OnboardingTwoView(currentTab: .constant(0))
}
