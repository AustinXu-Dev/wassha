//
//  SignInDetailView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI

struct SignInDetailView: View {
    
    @State var mobileNumber: String = ""
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    
    
    var body: some View {
        ZStack{
            Image("signin_detail_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(alignment: .center){
                Circle()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.white)
                    .overlay {
                        Image(systemName: "camera")
                            .foregroundStyle(.blue)
                    }.padding(.top, 0)
                Text("Add Photo")
                    .font(.headline)
                    .foregroundStyle(.white)
                Spacer().frame(height: 30)
                    
                mobileNumberField
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                
                emailField
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                
                nameField
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                
                passwordField
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                
                signupbutton
                    .padding(.vertical)
                loginbutton
                
                Spacer().frame(height: 100)

            }.frame(maxWidth: .infinity, maxHeight: 750)
//                .background(.red)
        }
    }
    
    
}

extension SignInDetailView{
    private var mobileNumberField: some View{
        TextField("", text: $mobileNumber,
                  prompt: Text("Enter Mobile Number").foregroundStyle(.black.opacity(0.7)))
        .textFieldStyle(.roundedBorder)
    }
    
    private var emailField: some View{
        TextField("", text: $email,
                  prompt: Text("Enter Email").foregroundStyle(.black.opacity(0.7)))
        .textFieldStyle(.roundedBorder)
    }
    
    private var nameField: some View{
        TextField("", text: $name,
                  prompt: Text("Name").foregroundStyle(.black.opacity(0.7)))
        .textFieldStyle(.roundedBorder)
    }
    
    private var passwordField: some View{
        SecureField("", text: $password,
                  prompt: Text("Password").foregroundStyle(.black.opacity(0.7)))
        .textFieldStyle(.roundedBorder)
    }
    
    private var signupbutton: some View{
        Button {
            // Sign Up action here
        } label: {
            Text("Sign Up")
                .frame(width: 100, height: 40)
                .foregroundStyle(.blue)
            
        }.background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    private var loginbutton: some View{
        HStack{
            Text("Already have account?")
                .font(.system(size: 15))
            Button("Log in") {
                //Log in action here
            }.font(.system(size: 15))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    SignInDetailView()
}
