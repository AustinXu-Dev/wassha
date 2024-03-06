//
//  LocationsView.swift
//  wassha
//
//  Created by Austin Xu on 2024/2/25.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: LocationViewModel
    @State private var currentPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    
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
        }.navigationBarBackButtonHidden()
    }
}

extension LocationsView{
    private var header: some View{
        VStack{
            HStack{
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .padding(.leading, 25)
                })
                Button(action: {vm.showLocationList.toggle()}, label: {
                    Text(vm.mapLocation.name)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundStyle(.primary) // can change primary
                        .frame(height: 65)
                        .frame(maxWidth: .infinity)
                        .animation(.none, value: vm.mapLocation)
                        .offset(x: -10)
                })
                
                Button(action: {
                    vm.mapRegion = currentPosition
                    CLLocationManager().requestWhenInUseAuthorization()
                }, label: {
                    Image(systemName: "location.circle.fill")
                        .font(.headline)
                        .padding(.trailing, 25)
                })
                
            }
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
            UserAnnotation {
                ZStack{
                    Circle()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(.blue.opacity(0.25))
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.white)
                    Circle()
                        .frame(width: 12, height: 12)
                        .foregroundStyle(.blue)
                }
            }
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
                    .scaleEffect(vm.mapLocation == location ? 1.5 : 0.7)
                    
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
