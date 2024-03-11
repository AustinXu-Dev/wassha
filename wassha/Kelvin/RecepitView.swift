import SwiftUI

struct RecepitView: View {
    var arrayOfArrays: [[String: [String: Int]]]
    var startDate, startTime, endTime : Date
    @State private var showingAlert = false
    @State private var name = ""
    
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
                                            
                                            Text("\(value == 0 ? 1 : value)")
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
                                Text("Wash + Dry Clean")
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
                                
                                Text("Dcondo ABAC")
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
                        .background(Color.blue)
                        .cornerRadius(10)
                    }
                    .padding(20)
                    .background(Color.white.opacity(1))
                    .cornerRadius(10)
                    .padding([.top, .leading, .trailing],20)
                    
                    AddressView()
                    
                    Spacer()
                    
                    Button(action: {
                        showingAlert.toggle()
                    }) {
                        Label("Special Note", systemImage: "ellipsis.message")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
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
                            .background(Color.white)
                            .foregroundColor(.blue)
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

