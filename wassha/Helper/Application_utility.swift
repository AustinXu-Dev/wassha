//
//  Application_utility.swift
//  wassha
//
//  Created by Akito Daiki on 9/3/2567 BE.
//

import Foundation
import UIKit
 
//Dependency Injection with UIViewController for UI
final class Application_utility {
    static var rootViewController: UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else{
            return .init()
        }
        guard let root = screen.windows.first?.rootViewController else{
            return .init()
        }
        return root
    }
}
