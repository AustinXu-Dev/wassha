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
    @State var isSearchng = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.wasshaBackgroundColor
                    .ignoresSafeArea()
                
                VStack(alignment: .center,spacing:10){
                    
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
                    HStack {
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
                        Spacer()
                    }
                    
                    //Search bar
                    
                    searchBar
                    
                    HStack {
                        Text("Suggestions")
                            .fontWeight(.bold)
                            .font(.system(size:25))
                        Spacer()
                    }
                
                    LaundryScrollView(laundries: $laundries)
                    HStack {
                        Text("Quick Service")
                            .fontWeight(.bold)
                            .font(.system(size:25))
                        Spacer()
                    }

                    ServicesScrollView()
                    Spacer()
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // MARK: Use navigation destination whenever you want to go another view, Navigationlink destination will give error
                .navigationDestination(for: ViewType.self) { value in
                    switch value{
                    case .searchView:
                        SearchView()
                    case .currentLocation:
                        Text("current")
                    case .locateOnMap:
                        LocationsView()
                            .environmentObject(LocationViewModel())
                    }
                }
            }
            
            .navigationTitle("WASSHA")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

extension HomeView{
    private var searchBar: some View{
        NavigationLink(value: ViewType.searchView) {
            RoundedRectangle(cornerRadius: 6)
                .frame(width: 350, height: 50)
                .foregroundStyle(Color(.systemGray5))
                .overlay {
                    HStack{
                        Text("Search Laundry")
                            .foregroundStyle(.placeholder)
                        Spacer()
                    }.padding(.horizontal)
                }
        }
    }
}

#Preview {
    HomeView()
}

