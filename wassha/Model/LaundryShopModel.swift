import Foundation
import Observation
import MapKit
//
//@Observable class LaundryShopModel:Identifiable {
//    var id:Int
//    var name:String
//    var image:String
//    var rating:Float
//    var phone:Int
//    var distance:Float
//    
//    
//    init(id: Int, name: String, image: String, rating: Float, phone: Int,distance:Float) {
//        self.id = id
//        self.name = name
//        self.image = image
//        self.rating = rating
//        self.phone = phone
//        self.distance = distance
//    }
//}

struct LaundryShopModel: Identifiable,Equatable{
    let id = UUID().uuidString
    let name: String
    let image: String
    let rating: Float
    let phone: Int
    let distance: Float
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageName: [String]
    
    
    static func == (lhs: LaundryShopModel, rhs: LaundryShopModel) -> Bool {
        lhs.id == rhs.id
    }
}

@Observable class ServiceType: Identifiable {
    
    var id = UUID()
    var serviceType: String
    var serviceTypeImage:String
    var isSelected: Bool
    
    
    init(id: UUID = UUID(), serviceType: String, serviceTypeImage: String, isSelected: Bool) {
        self.id = id
        self.serviceType = serviceType
        self.serviceTypeImage = serviceTypeImage
        self.isSelected = isSelected
    }
    
}

@Observable class ClothesType: Identifiable {
    
    var id = UUID()
    var clothesType: String
    var clothesTypeImage:String
    var isSelected: Bool
    
    init(id: UUID = UUID(), clothesType: String, clothesTypeImage: String, isSelected: Bool) {
        self.id = id
        self.clothesType = clothesType
        self.clothesTypeImage = clothesTypeImage
        self.isSelected = isSelected
    }
}
//enum ServiceType:String,CaseIterable {
//    case wash = "Wash"
//    case dryClean = "Dry Clean"
//    case washIron = "Wash & Iron"
//    case iron = "Iron"
//    case polish = "Polish"
//    case preWash = "Pre-Wash"
//
//
//}
//
//enum ClothesType:String,CaseIterable {
//    case cotton = "Cotton"
//    case lenin = "Lenin"
//    case silk = "Silk"
//    case denim = "Denim"
//    case polyester = "Polyester"
//    case wollen = "Wollen"
//
//
//}
enum QuickServiceModel:String,CaseIterable {
    case quickservice = "Quick Service"
    case wash = "Wash"
    case dryclean = "Dry Clean"
    
}


