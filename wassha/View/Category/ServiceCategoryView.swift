import SwiftUI
struct ServiceCategoryView: View {
//    @Binding var serviceType:[ServiceType]
//    @Binding var isSelected:Bool
//    @Binding var selectedServices:[ServiceType]
    @Binding var serviceTypes:[ServiceType]
    
    
    
    //    let horizontalRows = [ GridItem(.adaptive(minimum: 80))]
    
    
    
    
    
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 0){
            ForEach(serviceTypes,id:\.id){ service in
                VStack(alignment:.center,spacing:5){
                    Image(service.serviceTypeImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:35,height:35)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 13)
                            .stroke(lineWidth: 3)
                            .foregroundStyle( service.isSelected ? Color.blue.opacity(0.75) :     Color.gray.opacity(0.75)
                        ))
//                        .background(Color.gray.opacity(0.75))
//                        .cornerRadius(13)
                        .opacity(service.isSelected ? 1.0 : 0.5)
                        .scaleEffect(service.isSelected ? 0.9 : 1)
                        .animation(.spring,value:service.isSelected)
                        .cornerRadius(13)
                        .padding(10)
                        .shadow(color:.gray,radius:5)
                        .onTapGesture {
                            service.isSelected.toggle()
                        }
                        
                    
                    
                    Text(service.serviceType)
                        .font(.system(size:12))
                        .multilineTextAlignment(.center)
                    
                    
                }
                
            }
            
        }
        
        
    }
  
    }
#Preview {
    ServiceCategoryView(serviceTypes: .constant([
        
        ServiceType(serviceType: "Wash", serviceTypeImage: "Wash", isSelected: false),
        ServiceType(serviceType: "Dry Clean", serviceTypeImage: "Dry Clean", isSelected: false),
        ServiceType(serviceType: "Wash & Iron", serviceTypeImage: "Wash & Iron", isSelected: false),
        ServiceType(serviceType: "Iron", serviceTypeImage: "Iron", isSelected: false),
        ServiceType(serviceType: "Polish", serviceTypeImage: "Polish", isSelected: false),
        ServiceType(serviceType: "Pre-Wash", serviceTypeImage: "Pre-Wash", isSelected: false)
        ]
        
        ))
    
}
