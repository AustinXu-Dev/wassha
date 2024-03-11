//
//  BaseTabView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/11.
//

import SwiftUI

struct BaseTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", image: "home_icon")
                }
            HomeView()
                .tabItem {
                    Label("History", image: "history_icon")
                }
            HomeView()
                .tabItem {
                    Label("Inbox", image: "inbox_icon")
                }
            HomeView()
                .tabItem {
                    Label("More", image: "more_icon")
                }
        }
    }
}

#Preview {
    BaseTabView()
}
