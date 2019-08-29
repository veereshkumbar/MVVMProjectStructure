//
//  StringExtension.swift
//  Insta-Stats
//
//  Created by Sumit Ghosh on 01/02/19.
//  Copyright © 2019 Sumit Ghosh. All rights reserved.
//

import Foundation

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
    
    //MARK: - string encoding
    func encode(_ s: String) -> String {
        let data = self.data(using: .utf8, allowLossyConversion: true)!
        return String(data: data, encoding: .utf8)!
    }
    
    func decode(_ s: String) -> String? {
        let data = self.data(using: .utf8)!
        return String(data: data, encoding: .utf8)
    }
    
}

extension String {
    
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F:   // Variation Selectors
                return true
            default:
                continue
            }
        }
        return false
    }
    
}
