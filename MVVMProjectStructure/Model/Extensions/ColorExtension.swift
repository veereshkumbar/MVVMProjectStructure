//
//  ColorExtension.swift
//  Insta-Stats
//
//  Created by GLB-253 on 2/10/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    // Create a UIColor from RGB
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    // Create a UIColor from a hex value (E.g 0x000000)
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
    
}
extension UILabel {
    func changetextColor(fullText : String , changeText : String , changeTextColor : UIColor) {
        let strNumber: NSString = fullText as NSString
        
        let range = strNumber.range(of: changeText, options: .caseInsensitive)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: changeTextColor , range: range)
        self.attributedText = attribute
    }
}

