import SwiftUI

struct ClothesCategoryView: View {
    @Binding var clothesTypes:[ClothesType]


  
    //    let horizontalRows = [ GridItem(.adaptive(minimum: 80))]
    
    
    
    
    
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 0){
            ForEach(clothesTypes,id:\.id){ clothes in
                VStack(alignment:.center,spacing:5){
                    Image(clothes.clothesTypeImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:35,height:35)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 13)
                            .stroke(lineWidth: 3)
                            .foregroundStyle( clothes.isSelected ? Color.blue.opacity(0.75) :     Color.gray.opacity(0.75)

                        ))
//                        .background(Color.gray.opacity(0.75))
//                        .cornerRadius(13)
                        .opacity(clothes.isSelected ? 1.0 : 0.5)
                        .scaleEffect(clothes.isSelected ? 0.9 : 1)
                        .animation(.spring,value:clothes.isSelected)
                        .cornerRadius(13)
                        .padding(10)
                        .shadow(color:.gray,radius:5)
                        .onTapGesture {
                            clothes.isSelected.toggle()
                        }
                        
                    
                    
                    Text(clothes.clothesType)
                        .font(.system(size:12))
                        .multilineTextAlignment(.center)
                    
                    
                }
                
            }
            
        }
        
        
    }
  
    }


#Preview {
    ClothesCategoryView(clothesTypes: .constant([
    
    
    ClothesType(clothesType: "Cotton", clothesTypeImage: "Cotton", isSelected: false),
    ClothesType(clothesType: "Lenin", clothesTypeImage: "Lenin", isSelected: false),
    ClothesType(clothesType: "Silk", clothesTypeImage: "Silk", isSelected: false),
    ClothesType(clothesType: "Denim", clothesTypeImage: "Denim", isSelected: false),
    ClothesType(clothesType: "Polyester", clothesTypeImage: "Polyester", isSelected: false),
    ClothesType(clothesType: "Woollen", clothesTypeImage: "Woollen", isSelected: false),
    
    
    
    
    
    
    
    
    
    
    
    ]))
    

}

