//
//  GoogleSignInViewModel.swift
//  wassha
//
//  Created by Akito Daiki on 9/3/2567 BE.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import Firebase
 
class GoogleSignInViewModel: ObservableObject{
    
    init(){
        
    }
    
    func signInWithGoogle(presenting: UIViewController, completion: @escaping (Error?) -> Void){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        GIDSignIn.sharedInstance.signIn(withPresenting: Application_utility.rootViewController){ user, error  in
            if let error = error {
                DispatchQueue.main.async {
                    completion(error.localizedDescription as? Error)
                }
                return
            }
            guard let user = user?.user, let idToken = user.idToken else { return }
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
            Auth.auth().signIn(with: credential){ authResult, error in
                if let error = error{
                    DispatchQueue.main.async {
                        completion(error.localizedDescription as? Error)
                    }
                    return
                }
                guard authResult != nil else {
                    DispatchQueue.main.async {
                        completion(NSError(domain: "FirebaseAuthError", code: -1, userInfo: nil))
                    }
                    return
                }
                //handle Signin state
                UserDefaults.standard.set(true, forKey: "isSignIn")
            }
        }
    }
}
