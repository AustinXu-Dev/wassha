//
//  OnboardingOneView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct OnboardingOneView: View {
    @AppStorage(Constants.currentOnboardingVersion) private var hasSeenOnboardingView = false

    @Binding var currentTab: Int
    var body: some View {
        ZStack{
            Image("onboarding_image_1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x: -20)
            VStack(alignment: .trailing){
                Text("Having Trouble Washing Your Laundry?")
                    .font(.system(size: 45,weight: .semibold))
                    .lineLimit(5)
                    .multilineTextAlignment(.leading)
                    .frame(width: 200, height: 400)
                    .foregroundStyle(.white)
                    .padding(.trailing, 10)
                Spacer()
                HStack{
                    Button {
                        withAnimation(.easeInOut){
                            if currentTab == 0{
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
    OnboardingOneView(currentTab: .constant(0))
}
