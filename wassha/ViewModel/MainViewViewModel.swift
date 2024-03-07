//
//  MainViewViewModel.swift
//  wassha
//
//  Created by Akito Daiki on 6/3/2567 BE.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject{
    @Published var currentUserId: String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    //handling the state of current user
    init(){
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _,user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    //handling the sign in state
    public var isSignedIn: Bool{
        //getting the current user
        return Auth.auth().currentUser != nil
    }
}
