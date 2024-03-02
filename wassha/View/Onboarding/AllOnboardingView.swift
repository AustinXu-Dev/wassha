//
//  AllOnboardingView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct AllOnboardingView: View {
    
    var body: some View {
        NavigationStack{
            NavigationLink {
                SignInView()
            } label: {
                Text("go")
            }

        }
    }
}

#Preview {
    AllOnboardingView()
}
