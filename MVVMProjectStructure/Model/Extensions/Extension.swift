//
//  Extension.swift
//  RAP
//
//  Created by Sumit Ghosh on 26/02/19.
//  Copyright © 2019 Khusboo Suhasini Preety. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func applyGradient(colours: [UIColor]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func replaceGradient(colours: [UIColor]) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = nil
        self.layer.replaceSublayer((self.layer.sublayers?[0])!, with: gradient)
    }
}


extension UIView{
    func roundCorners(side:String,isDoc:Bool=false)
    {
        let maskLayer = CAShapeLayer()
        
        self.backgroundColor = .clear
        maskLayer.frame = self.bounds
        maskLayer.name = "cellMaskLayer"
        if side == "right"{
            maskLayer.fillColor = isDoc ? UIColor.lightGray.cgColor : UIColor.white.cgColor // your color
            maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        }else{
            maskLayer.fillColor = isDoc ? UIColor.rgb(red: 248, green: 197, blue: 190, alpha: 1).cgColor : UIColor.rgb(red: 235, green: 60, blue: 72, alpha: 1).cgColor// your color
            maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight, .bottomLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        }
        
        for layer in self.layer.sublayers!{
            if layer.name == "cellMaskLayer"{
                layer.removeFromSuperlayer()
            }
        }
        self.layer.insertSublayer(maskLayer, at: 0)
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
    }
    
    
    func roundOneCorner(corner:UIRectCorner,side: String){
        let maskLayer = CAShapeLayer()
        
        self.backgroundColor = .clear
        maskLayer.frame = self.bounds
        maskLayer.name = "cellMaskLayer"
        if side == "left"{
            maskLayer.fillColor = UIColor.rgb(red: 248, green: 197, blue: 190, alpha: 1).cgColor// your color
        }else{
            maskLayer.fillColor = UIColor.rgb(red: 235, green: 60, blue: 72, alpha: 1).cgColor// your color
        }
            maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [corner], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        
        for layer in self.layer.sublayers!{
            if layer.name == "cellMaskLayer"{
                layer.removeFromSuperlayer()
            }
        }
        self.layer.insertSublayer(maskLayer, at: 0)
//        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowColor = UIColor.darkGray.cgColor
//        self.layer.shadowOpacity = 0.5
    }
    
    func applyShadow() {
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOpacity = 0.5
    }
    
}

extension UIImageView{
    func roundCornersForImage(side:String){
        let maskLayer = CAShapeLayer()
        if side == "right"{
            maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        }else{
            maskLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomRight, .bottomLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        }
        
        self.layer.mask = maskLayer
        self.clipsToBounds = true
    }
}

extension UIColor{
    static func rgb(red: CGFloat,green: CGFloat,blue:CGFloat,alpha:CGFloat)->UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension Data {
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
}


extension Notification.Name {
    static let sendMessage = Notification.Name(
        rawValue: "sendMessage")
    
    static let sendGroupMessage = Notification.Name(
    rawValue: "sendGroupMessage")
    
    static let checkConnection = Notification.Name(
        rawValue:"checkConnection")
    
    
    static let makeConnection = Notification.Name("makeConnection")
    
    static let checkOnlineStatus = Notification.Name("checkOnlineStatus")
    
    static let checkTypingStatus = Notification.Name("checkTypingStatus")
    
    static let getContactDetail = Notification.Name("getContactDetail")
    
    static let messageSeen = Notification.Name("messageSeen")
    
    static let messageStatus = Notification.Name("messageStatus")
    
     static let receivedMessage = Notification.Name("receivedMessage")
    
    static let pendingMessage = Notification.Name("pendingMessage")
    
    static let updatedConversationTable = Notification.Name("updatedConversationTable")
    
    static let getScheduledMessage = Notification.Name("getScheduledMessage")
    
    static let groupCreation = Notification.Name("groupCreation")
    
    static let groupAddition = Notification.Name("groupAddition")
    
    static let enterCreatedGroup = Notification.Name("enterCreatedGroup")

    static let checkUserDataResponse = Notification.Name("checkUserDataResponse")
    
    static let updateContactNumberResponse = Notification.Name("updateContactNumberResponse")
    
    static let numberUpdateNotification = Notification.Name("numberUpdateNotification")
    
    static let updateContactDisplaynameResponse = Notification.Name("updateContactDisplaynameResponse")
    
    static let deleteAccountResponse = Notification.Name("deleteAccountResponse")
    
    static let leaveGroupNotification = Notification.Name("leaveGroupNotification")
    static let leftGroupNotification = Notification.Name("leftGroupNotification")
    static let removeFromGroupNotification = Notification.Name("removeFromGroupNotification")
    static let removedMemberNotification = Notification.Name("removedMemberNotification")
    
    //schedule notifications
    static let ScheduleMessageResponse = Notification.Name("ScheduleMessageResponse")
    static let fixScheduleMsgNotification = Notification.Name("fixScheduleMsgNotification")
    static let disclosefixScheduleMsg = Notification.Name("disclosefixScheduleMsg")
    static let sentFixScheduleMsg = Notification.Name("sentFixScheduleMsg")
    static let disclosedFixScheduleMsgStatus = Notification.Name("disclosedFixScheduleMsgStatus")
    
    static let sentScheduledMsg = Notification.Name("sentScheduledMsg")
    
    static let blockedAcknowledge = Notification.Name("blockedAcknowledge")
    static let blockedNotification = Notification.Name("blockedNotification")
}


extension String
{
    func group(by groupSize:Int=10, separator:String=",") -> String
    {
        if self.count <= groupSize   { return self }
        
        let splitSize  = min(max(2,self.count-2) , groupSize)
        let splitIndex = index(startIndex, offsetBy:splitSize)
        
        return substring(to:splitIndex)
            + separator
            + substring(from:splitIndex).group(by:groupSize, separator:separator)
    }
    
        var withEscapedNewlines: String {
            return self.replacingOccurrences(of: "\n", with: "\\n")
        }
    
    var withEscapedSpaces: String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func getLocalPathWith(name:String) -> String{
        return (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(name)
    }
    
    func getFileNameFromUrl() -> String{
        let lastName = self.split(separator: "/").last
        return String(lastName!)
    }
    
    func getMinutesFromSeconds()->String{
        if let val = Int(self){
            let minutes = val / 60 % 60
            let seconds = val % 60
            return String(format:"%02i:%02i", minutes, seconds)
        }else{
            return ""
        }
    }
}

extension Date{
    var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970 * 1000))
    }
    
    func currentTimeMillis()->Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    func monthAsString() -> String {
        let dF = DateFormatter()
        dF.setLocalizedDateFormatFromTemplate("MMM")
        return dF.string(from: self)
    }
    var timeStampInSec: Int64 {
        return Int64(self.timeIntervalSince1970)
    }
}

extension UIImage {
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    func resized(toWidth width: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
