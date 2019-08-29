//
//  DeviceType.swift
//  Insta-Stats
//
//  Created by Sumit Ghosh on 13/02/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import Foundation
import UIKit

class DeviceType:NSObject {
    
    static let sharedInstance = DeviceType()
    
    static let iphoneSE = "iPhone 5 or 5S or 5C"
    static let iphone7 = "iPhone 6/6S/7/8"
    static let iphone7p = "iPhone 6+/6S+/7+/8+"
    static let iphoneX = "iPhone X"
    static let unknown = "unknown"
    
    func getDevice() -> String {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
                return("iPhone 5 or 5S or 5C")
            case 1334:
                return("iPhone 6/6S/7/8")
            case 2208:
                return("iPhone 6+/6S+/7+/8+")
            case 2436:
                return("iPhone X")
            default:
                return("unknown")
            }
        }else{
            return ("unknown")
        }
    }
}
