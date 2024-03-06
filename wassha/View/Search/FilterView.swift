//
//  FilterView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedDistance: [String: Bool] = [
        "> 1 km": false,
        "1km - 5km": false, 
        "> 5 km": false
    ]
    
    @State private var selectedClothRow1: [String: Bool] = [
        "Denim": false,
        "Lenin": false,
        "Polyestar": false
    ]
    
    @State private var selectedClothRow2: [String: Bool] = [
        "Silk": false,
        "Cotton": false,
        "Woolen": false
    ]
    
    @State private var selectedServiceRow1: [String: Bool] = [
        "Wash": false,
        "Wash&iron": false,
        "Iron": false
    ]
    
    @State private var selectedServiceRow2: [String: Bool] = [
        "Dry Wash": false,
        "Poish": false,
        "Pre-wash": false
    ]

    @State private var selectedPriceRow: [String: Bool] = [
        "Low-High": false,
        "High-Low": false,
    ]
    
    @State private var selectedSort: [String: Bool] = [
        "Low-High": false,
        "High-Low": false,
    ]
    
    @Environment(\.dismiss) var dismiss
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 30){
            VStack(alignment:.leading){
                HStack{
                    Button {
                        isShowing.toggle()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15)
                    }
                    
                    Image("filter_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                    Text("Filter")
                        .font(.system(size: 30, weight: .semibold))
                    Spacer()
                }.padding(.leading, 5)
                    .frame(height: 50)
            }
            Divider()
                .frame(width: 300,height: 1)
                .overlay(.gray.opacity(0.7))
            
            VStack(alignment: .leading){
                HStack {
                    Text("Distance")
                    Spacer()
                }
                HStack(spacing: 15){
                    ForEach(self.selectedDistance.keys.sorted(), id: \.self){ item in
                        Button(action: {
                            selectedDistance[item]?.toggle()
                        }, label: {
                            Text(item)
                                .font(.system(size: 15))
                                .foregroundStyle(selectedDistance[item] ?? false ? .white: .black)
                                
                        })
                        .tint(selectedDistance[item] ?? false ? .blue: Color("filter_box_color"))
                        .buttonStyle(.borderedProminent)
                    }
                }
            }.frame(width: 300)
            
            VStack(alignment: .leading){
                HStack{
                    Text("Clothes Type")
                    Spacer()
                    Button(action: {
                        //
                    }, label: {
                        Text("All")
                            .font(.system(size: 15))
                    }).tint(.blue)
                        .buttonStyle(.borderedProminent)
                }
                
                HStack(spacing: 15){
                    ForEach(self.selectedClothRow1.keys.sorted(), id: \.self){ item in
                        Button(action: {
                            selectedClothRow1[item]?.toggle()
                        }, label: {
                            Text(item)
                                .font(.system(size: 15))
                                .foregroundStyle(selectedClothRow1[item] ?? false ? .white: .black)
                                
                        })
                        .tint(selectedClothRow1[item] ?? false ? .blue: Color("filter_box_color"))
                        .buttonStyle(.borderedProminent)
                    }
                }
                HStack(spacing: 15){
                    ForEach(self.selectedClothRow2.keys.sorted(), id: \.self){ item in
                        Button(action: {
                            selectedClothRow2[item]?.toggle()
                        }, label: {
                            Text(item)
                                .font(.system(size: 15))
                                .foregroundStyle(selectedClothRow2[item] ?? false ? .white: .black)
                                
                        })
                        .tint(selectedClothRow2[item] ?? false ? .blue: Color("filter_box_color"))
                        .buttonStyle(.borderedProminent)
                    }
                }
            }.frame(width: 300)
            
            VStack(alignment: .leading){
                HStack{
                    Text("Service Type")
                    Spacer()
                    Button(action: {
                        //
                    }, label: {
                        Text("All")
                            .font(.system(size: 15))
                    }).tint(.blue)
                        .buttonStyle(.borderedProminent)
                }
                
                HStack(spacing: 15){
                    ForEach(self.selectedServiceRow1.keys.sorted(), id: \.self){ item in
                        Button(action: {
                            selectedServiceRow1[item]?.toggle()
                        }, label: {
                            Text(item)
                                .font(.system(size: 15))
                                .foregroundStyle(selectedServiceRow1[item] ?? false ? .white: .black)
                                
                        })
                        .tint(selectedServiceRow1[item] ?? false ? .blue: Color("filter_box_color"))
                        .buttonStyle(.borderedProminent)
                    }
                }
                HStack(spacing: 15){
                    ForEach(self.selectedServiceRow2.keys.sorted(), id: \.self){ item in
                        Button(action: {
                            selectedServiceRow2[item]?.toggle()
                        }, label: {
                            Text(item)
                                .font(.system(size: 15))
                                .foregroundStyle(selectedServiceRow2[item] ?? false ? .white: .black)
                                
                        })
                        .tint(selectedServiceRow2[item] ?? false ? .blue: Color("filter_box_color"))
                        .buttonStyle(.borderedProminent)
                    }
                }
            }.frame(width: 300)
            
            VStack(alignment: .leading){
                HStack {
                    Text("Price")
                    Spacer()
                }
                HStack(spacing: 15){
                    ForEach(self.selectedPriceRow.keys.sorted(), id: \.self){ item in
                        Button(action: {
                            selectedPriceRow[item]?.toggle()
                        }, label: {
                            Text(item)
                                .font(.system(size: 15))
                                .foregroundStyle(selectedPriceRow[item] ?? false ? .white: .black)
                                
                        })
                        .tint(selectedPriceRow[item] ?? false ? .blue: Color("filter_box_color"))
                        .buttonStyle(.borderedProminent)
                    }
                }
            }.frame(width: 300)
            
            Divider()
                .frame(width: 300,height: 1)
                .overlay(.gray.opacity(0.7))
            
            VStack(alignment: .leading){
                HStack {
                    Text("Sort")
                    Spacer()
                }
                HStack(spacing: 15){
                    ForEach(self.selectedSort.keys.sorted(), id: \.self){ item in
                        Button(action: {
                            selectedSort[item]?.toggle()
                        }, label: {
                            Text(item)
                                .font(.system(size: 15))
                                .foregroundStyle(selectedSort[item] ?? false ? .white: .black)
                                
                        })
                        .tint(selectedSort[item] ?? false ? .blue: Color("filter_box_color"))
                        .buttonStyle(.borderedProminent)
                    }
                }
            }.frame(width: 300)
            
            
        }.frame(maxHeight: 757)
            .background(.white)
    }
}
//
//#Preview {
//    FilterView()
//}
