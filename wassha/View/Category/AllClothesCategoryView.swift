import SwiftUI
struct AllClothesCategoryView: View {
    
//    @State var laundryShopDetail:LaundryShopModel
    @State var laundryShop: LaundryShopModel
    @State var clothesTypes:[ClothesType] = [
        
        ClothesType(clothesType: "Cotton", clothesTypeImage: "Cotton", isSelected: false),
//        ClothesType(clothesType: "Lenin", clothesTypeImage: "Lenin", isSelected: false),
//        ClothesType(clothesType: "Silk", clothesTypeImage: "Silk", isSelected: false),
//        ClothesType(clothesType: "Denim", clothesTypeImage: "Denim", isSelected: false),
//        ClothesType(clothesType: "Polyester", clothesTypeImage: "Polyester", isSelected: false),
        ClothesType(clothesType: "Woollen", clothesTypeImage: "Woollen", isSelected: false)
        
        
        ]
    
    @ObservedObject var clothesviewModel: ClothesSelectionViewModel = ClothesSelectionViewModel()

    var body: some View {
        VStack{
            ScrollView(.vertical,showsIndicators:false){
                LaundryDetailView(laundryShop: $laundryShop)
                    .frame(width:400)
                    .padding(.top,50)
                
                Divider()
                VStack(alignment:.leading,spacing:10){
                    Text("Type of Clothes")
                        .font(.system(size:20))
                        .bold()
                    
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width:350,height:250)
                        .foregroundStyle(.white)
                        .shadow(color:.gray,radius:5)
                        .overlay(
                            
                            ClothesCategoryView(clothesTypes: $clothesTypes, clothesviewModel: clothesviewModel)
                            
                        )
                    
                }
                .padding()
                
                
                VStack(alignment:.center){
                    Button(action: {}, label: {
                        NavigationLink {
                            OrderOverviewView(clothesviewModel: clothesviewModel)
                        } label: {
                            
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.blue, lineWidth: 3)
                                .shadow(color: .gray, radius: 5)
                                .frame(width:183,height:40)
                                .overlay(
                                    
                                    Text("Continue")
                                        .foregroundStyle(.blue)
                                        .fontWeight(.heavy)
                                        .padding()
                                )
                            
                            
                        }
                        
                        
                    })
                    .padding(.vertical,20)
                    
                    
                    
                    
                    
                    
                    
                    
                } .padding()
                
            }
        }            
        .background(Color.wasshaBackgroundColor)

    }
}
//#Preview {
//    AllClothesCategoryView(laundryShop: LaundryShopModel(id: 1, name: "", image: "", rating: 1.3, phone: 1939933, distance: 1.4))
//}
//
