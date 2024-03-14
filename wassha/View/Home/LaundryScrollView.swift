import SwiftUI
struct LaundryScrollView: View {
    
    
    @Binding var laundries : [LaundryShopModel]
    
    
    
    var body: some View {
        
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:0){
                    ForEach(laundries,id:\.id){ laundry in
                        
                        NavigationLink {
                            AllServiceCategoryView(laundryShop: laundry)
                        } label: {
                        Image(laundry.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:250,height:170)
                            .cornerRadius(20)
                            .shadow(color:.gray,radius:5)
                            .overlay(
                                VStack(alignment:.leading){
                                    HStack {
                                        Image("star_review")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width:25,height:25)
                                        Text("\(String(laundry.rating))")
                                            .foregroundColor(.black)

                                    }

                                    
                                    .imageScale(.small)
                                    .symbolRenderingMode(.multicolor)
                                    .padding(.horizontal,5)
                                    .padding(.vertical,3.3)
                                    .background()
                                    .cornerRadius(10)
                                    
                                    Spacer()
                                    
                                    HStack(spacing:0){
                                        Text(laundry.name)
                                            .foregroundStyle(.black)
                                            .lineLimit(1)
                                        
                                        
                                        Spacer()
                                        Text("(\(String( laundry.rating))km)")
                                            .foregroundStyle(.blue)
                                    }
                                    .padding(.horizontal)
                                    .background(Color.white)
                                    .cornerRadius(30)
                                    
                                    
                                }
                                    .padding()
                                
                                //
                            )//end of Overlay
                        
                        
                        
                        
                    }
                    
                }
            }
            .padding()
        }
            
            
        }
    }
//#Preview {
//    LaundryScrollView(laundries: .constant([LaundryShopModel(id: 1, name: "WashXpress เอแบค​", image: "laundry_1_image", rating: 1.2, phone: 29949409, distance: 1.5),
//    LaundryShopModel(id: 2, name: "Test", image: "laundry_1_image", rating: 1.2, phone: 29949409, distance: 1.5)]
//    )
//    
//    )
//}

