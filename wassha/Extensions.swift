//
//  Extensions.swift
//  wassha
//
//  Created by Akito Daiki on 6/3/2567 BE.
//

import Foundation

extension Encodable{
    func asDictionary() -> [String: Any]{
        //converting into json
        guard let data = try? JSONEncoder().encode(self)
        else{
            return [:]
        }
        
        //putting json data into dictionary using serialization
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch{
            return [:]
        }
    }
}
