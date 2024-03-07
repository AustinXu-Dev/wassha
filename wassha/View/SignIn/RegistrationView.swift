//
//  RegistrationView.swift
//  wassha
//
//  Created by Akito Daiki on 6/3/2567 BE.
//

import SwiftUI

struct OTPVerificationView: View{
    var body: some View{
        VStack{
            
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Verfication")
    }
    
    @ViewBuilder
    func OTPField() -> some View{
        HStack(spacing: 14){
            ForEach(0..<6, id: \.self){ index in
                VStack(spacing: 8){
                    
                }
            }
        }
    }
}

//struct OTPVerificationView: View {
//    @ObservedObject var viewModel: RegistrationViewModel
//    
//    var body: some View {
//        VStack {
//            Text("Enter OTP sent to \(viewModel.phoneNumber)")
//                .padding()
//            
//            ForEach(0..<viewModel.otpFields.count, id: \.self) { index in
//                HStack{
//                    TextField("", text: Binding(
//                        get: { viewModel.otpFields[index] },
//                        set: { newValue in
//                            viewModel.otpFields[index] = newValue
//                            viewModel.otpText = viewModel.otpFields.joined()
//                        }
//                    ))
//                    .padding(8)
//                    .frame(width: 40, height: 40)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .keyboardType(.numberPad)
//                }
//            }
//            
//            Button("Verify OTP") {
//                viewModel.verifyOTP()
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.blue)
//            .cornerRadius(8)
//            .padding()
//            .disabled(viewModel.isLoading)
//        }
//        .alert(isPresented: $viewModel.showAlert) {
//            Alert(title: Text("Error"), message: Text(viewModel.errorMsg), dismissButton: .default(Text("OK")))
//        }
//        .padding()
//    }
//}
