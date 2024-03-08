//
//  AppDelegate.swift
//  wassha
//
//  Created by Akito Daiki on 8/3/2567 BE.
//

import Foundation
import GoogleSignIn
import Firebase
 
class AppDelegate: NSObject, UIApplicationDelegate {
    //handle the URL that application receives at the end of the authentication process
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Initializetion code for firebase
        FirebaseApp.configure()
        return true
    }
}
