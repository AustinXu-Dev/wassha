//
//  OtpFormFieldView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI
import Combine

struct OtpFormFieldView: View {
    //MARK -> PROPERTIES

    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour, pinFive, pinSix
    }

    @FocusState private var pinFocusState : FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    @State var pinFive: String = ""
    @State var pinSix: String = ""


    //MARK -> BODY
    var body: some View {
        
        ZStack {
            Image("signin_background")
            VStack {
                Image("wassha_logo")
                
                Spacer().frame(height: 50)
                Text("Enter vertification code sent from ..")
                    .foregroundStyle(.white)
                    .font(.caption)
                    .padding(.top)
                Spacer().frame(height: 30)
                
                otpfield
                .padding(.vertical)

                Spacer().frame(height: 50)
                
                
                // MARK: Verify OTP here
                Button {
                    // Verify Action works here
                    print(pinOne, pinTwo, pinThree, pinFour, pinFive, pinSix)
                    
                    
                } label: {
                    Text("Verify")
                        .frame(width: 100, height: 40)
                        .foregroundStyle(.blue)
                    
                }.background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                // MARK: Resend OTP action here
                HStack{
                    Text("Didn't receive code?")
                        .font(.system(size: 15))
                    Button("Resend") {
                        //Resend OTP code here
                    }.font(.system(size: 15))
                        .foregroundStyle(.white)
                }.padding(.vertical)
                
//                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: 750)
            
        }

    }
}

extension OtpFormFieldView{
    private var otpfield: some View{
        HStack(spacing:15, content: {

            TextField("", text: $pinOne)
                .modifier(OtpModifer(pin:$pinOne))
                .onChange(of:pinOne){oldValue, newValue in
                    if (newValue.count == 1) {
                        pinFocusState = .pinTwo
                    }
                }
                .focused($pinFocusState, equals: .pinOne)

            TextField("", text:  $pinTwo)
                .modifier(OtpModifer(pin:$pinTwo))
                .onChange(of: pinTwo, { oldValue, newValue in
                    if (newValue.count == 1) {
                        pinFocusState = .pinThree
                    }
                })
                .focused($pinFocusState, equals: .pinTwo)


            TextField("", text:$pinThree)
                .modifier(OtpModifer(pin:$pinThree))
                .onChange(of: pinThree, { oldValue, newValue in
                    if (newValue.count == 1) {
                        pinFocusState = .pinFour
                    }
                })
                .focused($pinFocusState, equals: .pinThree)


            TextField("", text:$pinFour)
                .modifier(OtpModifer(pin:$pinFour))
                .onChange(of: pinFour, { oldValue, newValue in
                    if (newValue.count == 1) {
                        pinFocusState = .pinFive
                    }
                })
                .focused($pinFocusState, equals: .pinFour)
            
            TextField("", text:$pinFive)
                .modifier(OtpModifer(pin:$pinFive))
                .onChange(of: pinFive, { oldValue, newValue in
                    if (newValue.count == 1) {
                        pinFocusState = .pinSix
                    }
                })
                .focused($pinFocusState, equals: .pinFive)

            TextField("", text:$pinSix)
                .modifier(OtpModifer(pin:$pinSix))
                .focused($pinFocusState, equals: .pinSix)

        })
    }
}

#Preview {
    OtpFormFieldView()
}
