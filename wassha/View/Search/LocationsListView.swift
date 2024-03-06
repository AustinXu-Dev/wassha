//
//  LocationsListView.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/26.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) { location in
                Button(action: {
                    vm.showNextLocation(location: location)
                }, label: {
                    listRowView(location: location)
                })
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }.listStyle(PlainListStyle())
    }
}

extension LocationsListView{
    private func listRowView(location: LaundryShopModel) -> some View {
        HStack{
            if let imageName = location.imageName.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            VStack(alignment: .leading){
                Text(location.name)
                    .font(.headline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationViewModel())
}
