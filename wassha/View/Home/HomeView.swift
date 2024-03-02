import SwiftUI
import CoreLocation
struct HomeView: View {
    @State var laundries : [LaundryShopModel] = [
    
        LaundryShopModel(id: 1, name: "Laundry Maid Cafe", image: "laundry_1_image", rating: 5, phone: 0642396256, distance: 1.8),
        LaundryShopModel(id: 2, name: "WashXpress เอแบค​", image: "laundry_2_image", rating: 3.7, phone: 0642396256, distance: 2.9),
        LaundryShopModel(id: 3, name: "WashXpress เอแบค​", image: "laundry_3_image", rating: 3.2, phone: 0642396256, distance: 2.3)
    
    ]
    @State var searchKeyword:String = ""
    @State var locationVM = LocationManagerViewModel()
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment:.leading,spacing:10){
                    
                    
                    HStack(spacing:0){
                        Text("Hi Kittama...")
                            .font(.system(size:20))
                        
                        
                        Spacer()
                        
                        Button{
                            
                        } label: {
                            Image(systemName:"bell.circle")
                                .foregroundStyle(.black)
                                .font(.system(size:25))
                            
                        }
                    }
                    
                    
                    
                    //location here
                    
                    
                    Button {
                        locationVM.requestLocation()
                    } label: {
                        HStack(spacing:5){
                            Image(systemName:"location.north.circle.fill")
                                .foregroundStyle(.black)
                                .font(.system(size:25))
                                
                            Text(locationVM.userAddress ?? "Location Unavailable")
                                .foregroundStyle(.black)
            
                        }
                    }
                    
                    
                    
                    
                    
                    Text("Suggestions")
                        .fontWeight(.bold)
                        .font(.system(size:25))
                
                    LaundryScrollView(laundries: $laundries)
                    Text("Quick Service")
                        .fontWeight(.bold)
                        .font(.system(size:25))

                        ServicesScrollView()
                    
                    
                    
                    
                }
                Spacer()
                .padding()
            }
            .padding()
           
            .background(Color.wasshaBackgroundColor)
        }
        
        .searchable(text: $searchKeyword)
       
     
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}
#Preview {
    HomeView()
}

