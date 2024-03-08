//
//  SignInView.swift
//  wassha
//
//  Created by Austin Xu on 2024/3/2.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn

struct SignInView: View {
    
    @State var phoneNumberAndEmail: String = ""
    @State var password: String = ""
    @StateObject private var vm = GoogleSignInViewModel()
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("signin_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(alignment: .center){
                    Text("Welcome!")
                        .font(.title3)
                        .foregroundStyle(.white)
                    Text("WASSHA")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundStyle(.white)
                    
                    emailField
                    .padding(.horizontal, 30)
                    .padding(.vertical)
                    
                    passwordField
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    
                    signinbutton
                        .padding(.vertical, 30)
                       
                    Divider()
                        .frame(width: 300,height: 5)
                        .overlay(.white)
                        .padding()
                    
                    signinwithgoogle
                        .padding(.vertical)
                    
                    signupbutton
                    
                    Spacer()
                        .frame(height: 90)
                    
                }.frame(maxWidth: .infinity, maxHeight: 750)
                
                .navigationBarBackButtonHidden()
            }
        }
    }
}

extension SignInView{
    
    // MARK: Email Field
    private var emailField: some View{
        TextField("Enter Mobile Number/ Email Id.", text: $phoneNumberAndEmail)
            .textFieldStyle(.roundedBorder)
    }
    
    // MARK: Password Field
    private var passwordField: some View{
        SecureField("Enter Password", text: $password)
            .textFieldStyle(.roundedBorder)
    }
    
    // MARK: Sign in Button
    private var signinbutton: some View{
        Button {
            // Sign in action here
        } label: {
            Text("Sign In")
                .frame(width: 100, height: 40)
                .foregroundStyle(.blue)
            
        }.background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
    
    // MARK: Sign in with Google Button
    private var signinwithgoogle: some View{
        Button {
            // Sign in with Google action here
            signInWithGoogle()
        } label: {
            Image("ios_light_sq_SI")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
            
        }
    }
    
    // MARK: Sign up Button
    private var signupbutton: some View{
        HStack{
            Text("Didn't have account?")
                .font(.system(size: 15))
            Button("Sign up") {
                //Sign up action here
            }.font(.system(size: 15))
                .foregroundStyle(.white)
        }
    }
    
    private func signInWithGoogle() {
        vm.signInWithGoogle(presenting: Application_utility.rootViewController) { error in
            DispatchQueue.main.async {
                print(error?.localizedDescription ?? "error")
            }
        }
    }
}

#Preview {
    SignInView()
}
