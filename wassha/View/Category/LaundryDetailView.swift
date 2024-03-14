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
                                .foregroundStyle(Color(#colorLiteral(red: 0.2745098039, green: 0.568627451, blue: 0.8274509804, alpha: 1)))
                                .bold()

                            Text("Distance \(String(format:"%.1f",laundryShop.distance))km")
                            
                            
                            HStack {
                                Image(systemName: "phone")
                                    .foregroundColor(.wasshaTextColor)
                                Text("0\(String(laundryShop.phone))")
                            }

                        }
                            .offset(x:-30)
                    )
                
                
                    .padding()
                
                
                
                
                Spacer()
                
                VStack(alignment:.center){
                    HStack {
                        Image("star_review")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:25,height:25)
                        Text("\(String(laundryShop.rating))")

                    }

                    .padding(.horizontal,5)
                    .padding(.vertical,7)
                    .imageScale(.small)
                    .symbolRenderingMode(.multicolor)
                    .tint(.blue)
                    .background(Color.white
                        .shadow(color:.gray,radius:5)
                    
                    )
                    .cornerRadius(10)
                    
                    
                    Text("20 Reviews")
                        .font(.system(size:16))
                        .foregroundStyle(Color.white)

                }
                
                
            }
        } .padding()
       
    }
}
//#Preview {
//    LaundryDetailView(laundryShop: .constant(LaundryShopModel(id: 1, name: "Test", image: "laundry_1_image", rating: 1.2, phone: 9393993, distance: 2.4)))
//}

