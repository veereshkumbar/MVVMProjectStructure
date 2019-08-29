//
//  Color Extension.swift
//  Insta-Stats
//
//  Created by GLB-253 on 2/10/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}
