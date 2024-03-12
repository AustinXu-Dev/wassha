import SwiftUI
struct AllServiceCategoryView: View {
    
    @State var laundryShop: LaundryShopModel
    @State var serviceTypes:[ServiceType] = [
        
        ServiceType(serviceType: "Wash", serviceTypeImage: "Wash", isSelected: false),
        ServiceType(serviceType: "Dry Clean", serviceTypeImage: "Dry Clean", isSelected: false)
//        ServiceType(serviceType: "Wash & Iron", serviceTypeImage: "Wash & Iron", isSelected: false),
//        ServiceType(serviceType: "Iron", serviceTypeImage: "Iron", isSelected: false),
//        ServiceType(serviceType: "Polish", serviceTypeImage: "Polish", isSelected: false),
//        ServiceType(serviceType: "Pre-Wash", serviceTypeImage: "Pre-Wash", isSelected: false)
        ]
    
    @ObservedObject var shared = ServiceSelectionViewModel.shared
    
  
    var body: some View {
            
        VStack{
            ScrollView(.vertical,showsIndicators:false){
                
                LaundryDetailView(laundryShop: $laundryShop)
                    .frame(width:400)
                    .padding(.top,50)
                
                Divider()
          

                VStack(alignment:.leading,spacing:10){
                    Text("Services Offered")
                        .font(.system(size:20))
                        .bold()
                    
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width:350,height:250)
                        .foregroundStyle(.white)
                        .shadow(color:.gray,radius:5)
                        .overlay(
                            ServiceCategoryView(serviceTypes: $serviceTypes)
                            
                        )
                    
                }
                .padding()
                
                
                VStack(alignment:.center){
                    Button(action: {}, label: {
                        NavigationLink {
                            AllClothesCategoryView(laundryShop: laundryShop)
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
           
        } .background(Color.wasshaBackgroundColor)
//            .ignoresSafeArea(.all)
           
    }
}
//#Preview {
//    AllServiceCategoryView(laundryShop: LaundryShopModel(id: 1, name: "Test", image: "laundry_1_image", rating: 1.2, phone: 9393993, distance: 2.4))
//}
//
