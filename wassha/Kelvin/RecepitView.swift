import SwiftUI

struct RecepitView: View {
    var arrayOfArrays: [[String: [String: Int]]]
    var startDate, startTime, endTime : Date
    @State private var showingAlert = false
    @State private var name = ""
    @ObservedObject var shared = ServiceSelectionViewModel.shared
    @State var locationVM = LocationManagerViewModel()
    
    @State var isRequestingLocation = false
    @State private var address = ""
    @State private var isEditing = false
    @State private var editedAddress = ""
    @State private var scrollProxy: ScrollViewProxy? = nil
    @State private var change = false
    
    var body: some View {
        VStack{
            ScrollView(.vertical,showsIndicators:false) {
                
                VStack {
                    VStack(alignment: .leading, spacing: 10) {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 30)
                            .foregroundColor(.black)
                            .overlay(
                                HStack {
                                    Text("Items")
                                        .foregroundColor(.white)
                                        .bold()
                                    
                                    Spacer()
                                    
                                    Text("Quantity")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                                    .padding()
                            )
                        
                        ForEach(arrayOfArrays.indices, id: \.self) { outerIndex in
                            ForEach(arrayOfArrays[outerIndex].sorted(by: { $0.key < $1.key }), id: \.key) { innerDictKey, innerDictValue in
                                VStack {
                                    ForEach(innerDictValue.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                        HStack {
                                            Text("\(key)")
                                            
                                            Spacer()
                                            
                                            Text("\(value)")
                                        }
                                    }
                                }
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Bag Size")
                                    .foregroundColor(.blue)
                                Text("5 KG")
                            }
                            Spacer()
                            
                            VStack {
                                Text("Quantity")
                                    .foregroundColor(.blue)
                                Text("01")
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Service")
                                    .foregroundColor(.blue)
//                                     made the service dynamic
                                ForEach(shared.selectedServices,id:\.self){service in
                                        Text(service)
                                    
                                }

                            }
                            Spacer()
                            
                            VStack {
                                Text("Price")
                                    .foregroundColor(.blue)
                                Text("100B")
                            }
                        }
                        
                        Divider()
                        
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Distance")
                                    .foregroundColor(.blue)
                                
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
                            
                            Spacer()
                            
                            VStack {
                                Text("Kg")
                                    .foregroundColor(.blue)
                                
                                Text("1.8 * 2")
                            }
                            
                            Spacer()
                            
                            VStack {
                                Text("Price")
                                    .foregroundColor(.blue)
                                
                                Text("50B")
                            }
                        }
                        
                        HStack {
                            Text("Total")
                                .foregroundColor(.white)
                            Spacer()
                            Text("40 B")
                                .foregroundColor(.white)
                        }
                        .padding(5)
                        .background(Color.blue.opacity(0.65))
                        .cornerRadius(10)
                    }
                    .padding(20)
                    .background(Color.white.opacity(1))
                    .cornerRadius(10)
                    .padding([.top, .leading, .trailing],20)
                    
//                    AddressView()
                    
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
                    
                    Spacer()
                    
                    Button(action: {
                        showingAlert.toggle()
                    }) {
                        Label("Special Note", systemImage: "ellipsis.message")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue.opacity(0.65))
                            .cornerRadius(10)
                    }
                    .padding([.leading, .trailing])
                    .alert("Enter your note here", isPresented: $showingAlert) {
                        TextField("Enter your note", text: $name)
                        Button("Save", action: submit)
                        Button("Cancel") {
                            showingAlert = false
                        }
                    } message: {
                        Text("You can add your note here!")
                    }
                    
                    NavigationLink(destination: CheckoutView()) {
                        Text("Pay now")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.65))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    .padding()
                }
            }
        }.background(Color.wasshaBackgroundColor)

    }
    
    func submit() {
        print("You entered \(name)")
    }
}

