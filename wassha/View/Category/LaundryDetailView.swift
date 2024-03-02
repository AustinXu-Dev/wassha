import SwiftUI
struct LaundryDetailView: View {
    @Binding var laundryShop: LaundryShopModel
    var body: some View {
        
        VStack(alignment:.center,spacing:20){
            Image(laundryShop.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(color:.gray,radius:5)
                .cornerRadius(25)
                .frame(width:500,height:217)
            HStack(spacing:0){
                
                
                
                RoundedRectangle(cornerRadius: 13)
                    .shadow(color:.gray,radius:5)
                    .foregroundStyle(.white)
                    .frame(width:230,height:100)
                    .overlay(
                        VStack(alignment:.leading){
                            Text(laundryShop.name)
                            
                            Text("Distance \(String(format:"%.1f",laundryShop.distance))km")
                            
                            
                            Label("0\(String(laundryShop.phone))", systemImage: "phone")
                        }
                            .offset(x:-30)
                    )
                
                
                    .padding()
                
                
                
                
                Spacer()
                
                VStack(alignment:.center){
                    Label("\(String(laundryShop.rating))",
                          systemImage: "star.fill"
                    )
                    .padding(.horizontal,5)
                    .padding(.vertical,7)
                    .foregroundColor(.black)
                    .imageScale(.small)
                    .symbolRenderingMode(.multicolor)
                    .tint(.blue)
                    .background(Color.white
                        .shadow(color:.gray,radius:5)
                    
                    )
                    .cornerRadius(10)
                    
                    
                    Text("20 Ratings")
                        .font(.system(size:16))
                }
                
                
            }
        } .padding()
       
    }
}
#Preview {
    LaundryDetailView(laundryShop: .constant(LaundryShopModel(id: 1, name: "Test", image: "laundry_1_image", rating: 1.2, phone: 9393993, distance: 2.4)))
}

