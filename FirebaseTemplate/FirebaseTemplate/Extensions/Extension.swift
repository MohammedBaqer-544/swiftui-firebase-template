//
//  Extension.swift
//  FirebaseTemplate
//
//  Created by Mohammed on 1/13/21.
//  Copyright © 2021 MohammedBaqer. All rights reserved.
//

import Foundation

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        else {
            throw NSError()
        }
        return dictionary
    }
    
}

extension Decodable {
    init(fromDictionary: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: fromDictionary, options: .prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}


extension String {
    func splitString() -> [String] {
        
        var stringArray: [String] = []
        let trimmed = String(self.filter { !" \n\t\r".contains($0)})

        for (index, _) in trimmed.enumerated(){
            let prefixIndex = index+1
            let substringPrefix = String(trimmed.prefix(prefixIndex)).lowercased()
            stringArray.append(substringPrefix)
            
        }
        return stringArray
    }
    
}

extension Date {
    func timeAgo() -> String {
    let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        return String(format: formatter.string(from: self, to: Date()) ?? "", locale: .current)
        
        
        
    }
    
}
