//
//  LocationsView.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationViewModel
    
    var body: some View {
        ZStack{
            mapLayer
            .ignoresSafeArea()
            
            VStack(spacing: 0){
                header
                    .padding()
                Spacer()
                locationsPreviewStack
            }
        }
    }
}

extension LocationsView{
    private var header: some View{
        VStack{
            Button(action: {vm.showLocationList.toggle()}, label: {
                Text(vm.mapLocation.name)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.primary) // can change primary
                    .frame(height: 65)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(.primary) // can change primary
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                    }
            })
            
            if vm.showLocationList{
                LocationsListView()
            }
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View{
        Map(position: $vm.mapRegion){
            ForEach(vm.locations) {location in
                Annotation(location.name, coordinate: location.coordinates) {
                    
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.blue)
                            .overlay {
                                Image(systemName: "washer")
                                    .foregroundStyle(.white)
                            }
                    }
                    .scaleEffect(vm.mapLocation == location ? 1.2 : 0.7)
                    
                }
            }
        }
    }
    
    private var locationsPreviewStack: some View{
        ZStack{
            ForEach(vm.locations){ location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}



#Preview {
    LocationsView()
        .environmentObject(LocationViewModel())
}
