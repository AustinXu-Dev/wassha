import Foundation

class OrderDetailViewModel: ObservableObject {
    @Published var itemCounts: [String: Int] = [:]
    @Published var startDate: Date = Date()
    @Published var startTime: Date = Date()
    @Published var endTime: Date = Date()
    
    init(items: [String]) {
       for item in items {
           
       }
    }
}
