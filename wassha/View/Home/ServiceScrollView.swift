import SwiftUI
struct ServicesScrollView: View {
    
    let quickServiceCases: [QuickServiceModel] = QuickServiceModel.allCases
    
    var body: some View {
        
        ScrollView(.horizontal,showsIndicators:false){
            HStack(alignment:.top,spacing:10){
                ForEach(quickServiceCases,id:\.self){ service in
                    VStack(spacing:10){
                        Image(service.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                            .frame(width:48,height:48)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(25)
                            .shadow(color:.gray.opacity(0.6),radius:5)
                            .frame(width:98,height:98)
                        
                        Text(service.rawValue)
                            .font(.system(size:20))
                            .frame(width:70)
                            .multilineTextAlignment(.center)
                            .lineLimit(2)
                           
                            
                        
                    }
                    
                    
                    
                    
                }
            }
            
            
        } .padding()
    }
}
#Preview {
    ServicesScrollView()
}

