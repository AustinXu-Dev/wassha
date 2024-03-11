import SwiftUI

struct ClothesCategoryView: View {
    @Binding var clothesTypes:[ClothesType]
    //    let horizontalRows = [ GridItem(.adaptive(minimum: 80))]
        @ObservedObject var clothesviewModel: ClothesSelectionViewModel 
    var body: some View {
        LazyVGrid(columns:  [GridItem(.adaptive(minimum: 170, maximum: 135))], spacing: 0){
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
                            clothesviewModel.updateSelectedClothes(clothesTypes: clothesTypes)
                        }
                    
                    
                    
                    Text(clothes.clothesType)
                        .font(.system(size:12))
                        .multilineTextAlignment(.center)
                    
                    
                }
                
            }
            
        }
        
        
    }
    
//    private func updateSelectedClothes() {
//        var selectedClothesDict: [[String: [String: Int]]] = []
//                                                              
//        for type in clothesTypes where type.isSelected {
//            if type.clothesType == "Cotton" {
//                selectedClothesDict = [[type.clothesType : ["dress" : 0]], [type.clothesType : ["shirt" : 0]]]
//                clothesviewModel.selectedClothes = selectedClothesDict
//            } else {
//                selectedClothesDict = [[type.clothesType : ["trousers" : 0]], [type.clothesType : ["dress" : 0]]]
//                clothesviewModel.selectedClothes = selectedClothesDict
//
//                }
//                                           
//                                           
//            }
//                                           
//        }
                                           
                                           
}
                                           
                                           
                                           
                                           
                                           
                                           
