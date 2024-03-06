//
//  SearchView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct SearchView: View {
    
    @State var presentSideMenu = false
    
    @State var searchText = ""
    @State var isSearching = false
    @State var showingSideBar = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            SideMenu(isShowing: $showingSideBar, content: AnyView(FilterView(isShowing: $showingSideBar)))
                .zIndex(2)
            VStack(spacing: 20){
                HStack{
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                            .foregroundStyle(.white)
                    }
                    
                    
                    SearchBar(searchText: $searchText, isSearching: $isSearching, showingSidebar: $showingSideBar)
                }
                .padding(.leading, 10)
                
                
                Divider()
                    .overlay(Color.white)
                
                HStack(spacing: 20){
                    NavigationLink(value: ViewType.currentLocation) {
                        Image(systemName: "location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Use current location")
                            .font(.system(size: 15))
                    }.foregroundStyle(.black)
                    Text("|")
                    NavigationLink(value: ViewType.locateOnMap) {
                        Image(systemName: "map")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Locate on map")
                            .font(.system(size: 15))
                    }.foregroundStyle(.black)
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: 40)
                    .background(.white)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.wasshaBackgroundColor)
            
        }

        
    }
}

#Preview {
    SearchView()
}
