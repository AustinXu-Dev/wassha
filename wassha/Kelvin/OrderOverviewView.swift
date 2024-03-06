import SwiftUI

struct orderDetail {
    var quantities: [String: Int] = [:]
}

struct OrderOverviewView: View {
    
    @State var viewModel = orderDetail()
    @State var startDate: Date = Date()
    @State var startTime: Date = Date()
    @State var endTime: Date = Date()
    @State var arrayOfArrays: [[String: [String: Int]]] = [
        ["Cotton items": ["dress": 0, "shirt": 0]],
        ["Woollen items": ["trousers": 0, "dress": 0]]
    ]
    
    var limitRange: ClosedRange<Date>{
        let oneMonthAgo = Calendar.current.date(byAdding: .month, value: -1, to: Date())
        let twoMonthFromNow = Calendar.current.date(byAdding: .month,value: 2, to: Date())
        return oneMonthAgo!...twoMonthFromNow!
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.opacity(0.8).edgesIgnoringSafeArea(.all)
                VStack {
                        ForEach(arrayOfArrays.indices, id: \.self) { outerIndex in
                            ForEach(arrayOfArrays[outerIndex].sorted(by: { $0.key < $1.key }), id: \.key) { innerDictKey, innerDictValue in
                                VStack(alignment: .leading) {
                                    Text("\(innerDictKey)")
                                        .foregroundColor(.primary)
                                        .padding(.leading, 20)
                                        
                                    
                                    ForEach(innerDictValue.sorted(by: { $0.key < $1.key }), id: \.key) { key, value in
                                        HStack {
                                            HStack {
                                                VStack {
                                                    Image(key)
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 30, height: 30)
                                                        .padding(10)
                                                        .foregroundColor(.primary)
                                                        .background(Color("overview-theme"))
                                                        .cornerRadius(10)
                                                        .overlay (
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .stroke(Color.black, lineWidth: 1)
                                                        )
                
                                                    Text("\(key)")
                                                        .foregroundColor(.black)
                                                        .font(.caption2)
                                                }
                                                .padding(.trailing, 20)
                                                ProfileImageView()
                                            }
                                            
                                            Spacer()
                                            
                                            CustomStepper(value: self.binding(for: key, in: innerDictKey, outerIndex: outerIndex))
                                        }
                                        .padding(10)
                                             .background(Color.white)
                                             .cornerRadius(10)
                                             .padding([.leading, .trailing], 20)
                                    }

                                }
                            }
                        }
                    
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("text_color_grey"))
                            .fill(.white)
                            .overlay {
                                DatePicker("Select Date&Time", selection: $startDate, in: Date()..., displayedComponents: .date)
                                    .padding()
                                    .foregroundColor(.black)
                            }.padding([.leading, .trailing, .top, .bottom], 20)
    
                        HStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("text_color_grey"))
                                .fill(.white)
                                .overlay {
                                    DatePicker("Start", selection: $startTime, in: limitRange,displayedComponents: [.hourAndMinute])
                                        .padding()
                                        .foregroundColor(.black)
                                }
                                .frame(width: 175, height: 50)
    
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("text_color_grey"))
                                .fill(.white)
                                .overlay {
                                    DatePicker("End", selection: $endTime, in:limitRange,displayedComponents: [.hourAndMinute])
                                        .padding()
                                        .foregroundColor(.black)
                                }
                                .frame(width: 175, height: 50)
    
    
                        }

                        NavigationLink(destination: RecepitView(arrayOfArrays: arrayOfArrays, startDate: startDate, startTime: startTime, endTime: endTime)) {
                            Text("Show Detail")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.blue)
                                .cornerRadius(10)
                        }
                        .padding()

                }
            }
        }
    }

    private func binding(for key: String, in outerKey: String, outerIndex: Int) -> Binding<Int> {
          return Binding<Int>(
              get: {
                  self.arrayOfArrays[outerIndex][outerKey]?[key] ?? 0
              },
              set: { newValue in
                  self.arrayOfArrays[outerIndex][outerKey]?[key] = newValue
              }
          )
      }
}

struct CustomStepper: View {
    @Binding var value: Int

    var body: some View {
        HStack {
            Button(action: {
                if self.value > 0 {
                    self.value -= 1
                }
            }) {
                Image(systemName: "minus.circle")
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Circle())
            }
            .padding(.trailing)

            Text("\(value)")
                .font(.headline)
                .foregroundColor(.black)

            Button(action: {
                self.value += 1
            }) {
                Image(systemName: "plus.circle")
                    .font(.title2)
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Circle())
            }
            .padding(.leading)
        }
    }
}

