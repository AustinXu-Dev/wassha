//
//  LocationPreviewView.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/26.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationViewModel
    let location: LaundryShopModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0){
            VStack(alignment: .leading, spacing: 16){
                imageSection
                titleSection
            }
            
            VStack (spacing: 8){
                learnMoreButton
                nextButton
                
            }
        }.padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension LocationPreviewView{
    private var imageSection: some View{
        ZStack{
            if let imageName = location.imageName.first{
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading){
            Text(location.name)
                .font(.headline)
                .fontWeight(.bold)
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View{

        Button(action: {
            
        }, label: {
            NavigationLink(destination: AllServiceCategoryView(laundryShop: location)) {
                Text("Detail")
                    .font(.headline)
                    .frame(width: 125, height: 35)
            }
            .foregroundStyle(.white)
        })
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View{
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
            
        })
        .buttonStyle(.bordered)
    }
}


#Preview {
    ZStack{
        Color.blue.ignoresSafeArea()
        LocationPreviewView(location: LocationsDataService.locations.first!)
    }
    .environmentObject(LocationViewModel())
    
}
