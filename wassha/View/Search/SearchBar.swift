//
//  SearchBar.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/3.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var isSearching: Bool
    @Binding var showingSidebar: Bool
    
    var body: some View {
        HStack {
            HStack {
                TextField("Search terms here", text: $searchText)
                    .padding(.leading, 24)
            }
            .padding(10)
            .background(Color(.systemGray5))
            .cornerRadius(6)
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    Button(action: {
                        self.showingSidebar.toggle()
                    }, label: {
                        Image("filter_logo")
                        
                    })
                    if isSearching {
                        Button(action: { searchText = "" }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .padding(.vertical)
                        })
                        
                    }
                    
                }.padding(.horizontal, 25)
                .foregroundColor(.gray)
            ).transition(.move(edge: .trailing))
//            .animation(.spring())
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchText = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                }, label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
//                .animation(.spring)
            }
            
        }
        .navigationBarBackButtonHidden()
    }
}
