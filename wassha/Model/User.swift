//
//  User.swift
//  wassha
//
//  Created by Akito Daiki on 6/3/2567 BE.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let phoneNumber: String
    let joined: TimeInterval
}
