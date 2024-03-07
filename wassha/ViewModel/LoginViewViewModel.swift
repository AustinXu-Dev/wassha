//
//  LoginViewViewModel.swift
//  wassha
//
//  Created by Akito Daiki on 6/3/2567 BE.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var showAlert = false
    
    init(){}
    
    func login(){
        guard validate()
        else{
            return
        }
        
        //LogIn
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    //validation
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            errorMessage = "Please fill in all fields"
            showAlert = true
            return false
        }
        
        //email validate
        guard email.contains("@") && email.contains(".")
        else{
            errorMessage = "Please enter a valid email"
            showAlert = true
            return false
        }
        return true
    }
    
    private func logOut(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}
