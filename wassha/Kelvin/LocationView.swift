//
//  LocationView.swift
//  wassha
//
//  Created by Kelvin Gao  on 15/3/2567 BE.
//

import SwiftUI

struct LocationView: View {
    
    @State var isRequestingLocation = false
    @State var locationVM = LocationManagerViewModel()
    @State private var address = ""
    @State private var isEditing = false
    @State private var editedAddress = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
    @State private var change = false

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    Text("Delivery Detail")
                        .bold()
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 70)
                        .foregroundColor(.white)
                        .overlay(
                            HStack {
                                VStack {
                                    Image("customer")
                                    if !change {
                                        Text(self.locationVM.userAddress ?? self.editedAddress)
                                            .font(.system(size: 10))
                                            .bold()
                                            .foregroundColor(.blue)
                                            .minimumScaleFactor(0.5)
                                    } else {
                                        Text(self.editedAddress)
                                            .font(.system(size: 10))
                                            .bold()
                                            .foregroundColor(.blue)
                                    }
                                  
                                } // end of VStack
                                .padding()
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.blue)
                                Spacer()
                                
                                VStack {
                                    Image("machine")
                                    Text("Machine")
                                        .font(.caption)
                                        .bold()
                                        .foregroundColor(.blue)

                                }
                                .padding()
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.blue)
                                Spacer()
                                
                                VStack {
                                    Image("shirt 1")
                                    if !change {
                                        Text(self.locationVM.userAddress ?? self.editedAddress)
                                            .font(.system(size: 10))
                                            .bold()
                                            .foregroundColor(.blue)
                                            .minimumScaleFactor(0.5)
                                    } else {
                                        Text(self.editedAddress)
                                            .font(.system(size: 10))
                                            .bold()
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding()
                            }
                            .foregroundColor(.white)
                        )
                }
                .padding([.leading, .trailing],20)
                
                Spacer()
                
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.2))
                        .frame(height: 50)
                        .overlay(
                            HStack {
                                if isEditing {
                                    TextField("Enter address", text: $editedAddress)
                                        .textFieldStyle(PlainTextFieldStyle())
                                } else {
                                    Text(address)
                                }
                                
                                Spacer()

                                Button(action: {
                                    if isEditing {
                                        address = editedAddress // Update address here
                                        isEditing.toggle()
                                        change = true
                                    } else {
                                        isEditing.toggle()
                                        change = true
                                        editedAddress = address // Sync editedAddress with address when editing starts
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                            withAnimation {
                                                scrollProxy = proxy
                                                scrollProxy?.scrollTo(0)
                                            }
                                        }
                                    }
                                }) {
                                    Text(isEditing ? "Save" : "Edit Address")
                                        .foregroundColor(.blue)
                                }
                                .padding(.horizontal)
                            }
                            .padding()
                        )
                }
                .padding()
            }
            .onAppear {
                scrollProxy = proxy
            }
        }

        
        RoundedRectangle(cornerRadius: 6)
             .foregroundStyle(.white)
             .frame(width:360,height:40)
             .shadow(color:.gray,radius:2)
             .overlay(
                 HStack{
                     Text("Your Current Location")
                         .foregroundStyle(.black)
                         .font(.system(size:20))
                     Spacer()
                     Button {
                         self.locationVM.requestLocation()
                         change = false
                         self.editedAddress = locationVM.userAddress ?? ""
                     } label: {
                         Image(systemName:"location.north.circle.fill")
                             .resizable()
                             .aspectRatio(contentMode: .fit)
                             .frame(width:25,height:25)
                             .foregroundStyle(.black)

                     }
                     
                 }
                     .padding()
             )
    }
}

#Preview {
    LocationView()
}
