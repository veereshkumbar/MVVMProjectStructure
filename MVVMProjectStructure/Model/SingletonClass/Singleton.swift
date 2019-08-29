//
//  Singleton.swift
//  RAP
//
//  Created by GLB-254 on 4/11/19.
//  Copyright © 2019 GLB-254. All rights reserved.
//

import UIKit
import Foundation
import AudioToolbox
import AVFoundation
class Singleton {
    
    static let sharedSingleton = Singleton()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    func localFilePath(for url: URL) -> URL {
        return documentsPath.appendingPathComponent(url.lastPathComponent)
    }

    func convertDictionaryToJsonString(dataDict:Dictionary<String,Any>) -> String {
        
        let jsonData = try! JSONSerialization.data(withJSONObject: dataDict, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        
        print(jsonString)
        return jsonString
    }
    
    // convertJsonStringToDictionary
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
    

    
  
    //MARK: - Iphone X check
    func isIphoneX() -> Bool{
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone{
            let screenSize = UIScreen.main.bounds.size;
            if screenSize.height == 812 // portrait height = 812
            {
                return true;
            }
            if self.isIphoneXR(){
                return true;
            }
        }
        return false;
    }
    
    func isIphoneXR() -> Bool{
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone{
            let screenSize = UIScreen.main.bounds.size;
            if screenSize.height == 896 && screenSize.width == 414
            {
                return true;
            }
        }
        return false;
    }

    
    
    //MARK: - timestamp and date conversions
    
    func getSectionStringFromTimestamp(timestamp: String) -> String {
        let dayCheck = self.dayDifference(from: TimeInterval(timestamp)!)
        var messageTimeString = String()
        if dayCheck == ""{
            messageTimeString = self.getDateStringForSectionFromTimeStamp(timestamp: UInt64(timestamp)!)
        }else{
            messageTimeString = "\(dayCheck)"
        }
        return messageTimeString
    }
    
    func dayDifference(from interval : TimeInterval) -> String
    {
        let calendar = Calendar.current
        let date = Date(timeIntervalSince1970: interval/1000)
        
        if calendar.isDateInYesterday(date) { return "Yesterday" }
        else if calendar.isDateInToday(date) { return "Today" }
        else if calendar.isDateInWeekend(date){
            return getWeekDaysFromTimeStamp(timestamp: UInt64(interval))
        }else{
            let startOfNow = calendar.startOfDay(for: Date())
            let startOfTimeStamp = calendar.startOfDay(for: date)
            let components = calendar.dateComponents([.day], from: startOfNow, to: startOfTimeStamp)
            let day = components.day!
            if day >= -7{
                return getWeekDaysFromTimeStamp(timestamp: UInt64(interval))
            }else{
                return ""
            }
        }
    }
    
    func getTimeForScheduledMessage(interval : String) -> String{
        let calendar = Calendar.current
        
        let date = Date(timeIntervalSince1970: TimeInterval(interval)!)
        
        if calendar.isDateInYesterday(date) { return "Yesterday" }
        else if calendar.isDateInToday(date) {
            return "at \(getTimeFromTimeStamp(timestamp: UInt64(interval)!,forScheduled: true))"
        }else if calendar.isDateInWeekend(date){
            return "on \(getWeekDaysFromTimeStamp(timestamp: UInt64(interval)!)) at \(getTimeFromTimeStamp(timestamp: UInt64(interval)!,forScheduled: true))"
        }else{
            return "on \(getDateFromTimeStamp(timestamp: UInt64(interval)!)) at \(getTimeFromTimeStamp(timestamp: UInt64(interval)!,forScheduled: true))"
        }
    }
    
    
    func getTimeFromTimeStamp(timestamp:UInt64,forScheduled:Bool = false) -> String{
        let dateFromTimeStamp = Date(timeIntervalSince1970: forScheduled ? (Double(timestamp)) : (Double(timestamp) / 1000))
        let dateFormatter = DateFormatter();
        
        let dateFormat = "h:mm a"; //Any TimeFormat you want
        dateFormatter.dateFormat = dateFormat;
        let formattedDate = dateFormatter.string(from: dateFromTimeStamp);
        dateFormatter.locale = NSLocale.current;
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT");
        
        dateFormatter.dateFormat = dateFormat as String;
        
        return formattedDate as String
        
    }
    
    func getDateAndTimeFromTimeStamp(timestamp:UInt64) -> String{
        let dateFromTimeStamp = Date(timeIntervalSince1970: Double(timestamp) / 1000)
        let dateFormatter = DateFormatter();
        
        let dateFormat = "dd/MM/YYYY h:mm a"; //Any TimeFormat you want
        dateFormatter.dateFormat = dateFormat;
        let formattedDate = dateFormatter.string(from: dateFromTimeStamp);
        dateFormatter.locale = NSLocale.current;
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT"); //Pass Appropriate time zone here.
        
        dateFormatter.dateFormat = dateFormat as String;

        
        return formattedDate as String
        
    }
    
    func getDateFromTimeStamp(timestamp:UInt64) -> String{
        let dateFromTimeStamp = Date(timeIntervalSince1970: Double(timestamp) / 1000)
        let dateFormatter = DateFormatter();
        
        let dateFormat = "dd/MM/YYYY"; //Any TimeFormat you want
        dateFormatter.dateFormat = dateFormat;
        let formattedDate = dateFormatter.string(from: dateFromTimeStamp);
        dateFormatter.locale = NSLocale.current;
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT"); //Pass Appropriate time zone here.
        
        dateFormatter.dateFormat = dateFormat as String;
        //        let sourceDate = dateFormatter.date(from: formattedDate as String);
        
        return formattedDate as String
        
    }
    
    func getDateStringForSectionFromTimeStamp(timestamp:UInt64) -> String{
        let dateFromTimeStamp = Date(timeIntervalSince1970: Double(timestamp) / 1000)
        let dateFormatter = DateFormatter();
        
        let dateFormat = "EEE, dd MMM"; //Any TimeFormat you want
        dateFormatter.dateFormat = dateFormat;
        let formattedDate = dateFormatter.string(from: dateFromTimeStamp);
        dateFormatter.locale = NSLocale.current;
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT"); //Pass Appropriate time zone here.
        
        dateFormatter.dateFormat = dateFormat as String;
        //        let sourceDate = dateFormatter.date(from: formattedDate as String);
        
        return formattedDate as String
        
    }
    
    func getWeekDaysFromTimeStamp(timestamp:UInt64,forScheduled:Bool=false) -> String{
        let dateFromTimeStamp = Date(timeIntervalSince1970: forScheduled ? (Double(timestamp)) : (Double(timestamp) / 1000))
        let dateFormatter = DateFormatter();
        
        let dateFormat = "EEEE"; //Any TimeFormat you want
        dateFormatter.dateFormat = dateFormat;
        let formattedDate = dateFormatter.string(from: dateFromTimeStamp);
        dateFormatter.locale = NSLocale.current;
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT"); //Pass Appropriate time zone here.
        
        dateFormatter.dateFormat = dateFormat as String;
        //        let sourceDate = dateFormatter.date(from: formattedDate as String);
        
        return formattedDate as String
        
    }
    
    
    //MARK: - Binary Search Algorithm
    //Note: the Array must be sorted one
    func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
        var lowerBound = 0
        var upperBound = a.count
        while lowerBound < upperBound {
            let midIndex = lowerBound + (upperBound - lowerBound) / 2
            if a[midIndex] == key {
                return midIndex
            } else if a[midIndex] < key {
                lowerBound = midIndex + 1
            } else {
                upperBound = midIndex
            }
        }
        return nil
    }
    
    //MARK: - showing alert message
    func showAlertViewWithOk(title:String,message:String,controller:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
    
   
    //MARK: - get image from pdf file
    func drawImageFromPdfUrl(url:URL) -> UIImage?{
        guard let document = CGPDFDocument(url as CFURL) else { return nil }
        guard let page = document.page(at: 1) else { return nil }
        
        let pageRect = page.getBoxRect(.cropBox)
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: pageRect.size.width, height: pageRect.size.height/2))
        let img = renderer.image { (ctx) in
            UIColor.white.set()
            ctx.fill(pageRect)
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height)
            ctx.cgContext.scaleBy(x: 1.0, y: -1)
            ctx.cgContext.drawPDFPage(page)
        }
        return img
    }
    
    //MARK: - data size converter
    func dataSizeConverter(_ data: Double)->String{
        
        let fileSizeWithUnit = ByteCountFormatter.string(fromByteCount:Int64(data) , countStyle: .file)
        return fileSizeWithUnit
    }
    
    
    //MARK: - vibrating alert
    func vibrateDevice(){
//        AudioServicesPlaySystemSound(1519); // Weak
//        AudioServicesPlaySystemSound(1520);// strong
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    func vibrateDeviceShortly(){
        AudioServicesPlaySystemSound(1519);
    }
    
    func keepSoundsReady(){
        DispatchQueue.global().async {

        let soundsArray = ["sentMessage","recievedMessage","audioClicked","deleteAudio"]
         var audioUrl:URL!
        for i in 0..<soundsArray.count{
            audioUrl = Bundle.main.url(forResource: soundsArray[i], withExtension: "wav")
            var soundID: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(audioUrl! as CFURL, &soundID)
            switch i {
            case 0://sent message
//                self.applicationSounds["SM"] = soundID
                break
                
            case 1://recieved message
//                self.applicationSounds["RM"] = soundID
                break
                
            case 2://Audio Clicked
//                self.applicationSounds["AC"] = soundID
                break
                
            case 3://Delete Audio
//                self.applicationSounds["DA"] = soundID
                break
            default:
                print("some different case to work with")
                return
            }
        }
        }
    }
    

    func playSoundFor(soundId:SystemSoundID){
//        AudioServicesPlaySystemSound(soundId)
        try? AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
        try? AVAudioSession.sharedInstance().setActive(false)
        
        AudioServicesPlaySystemSoundWithCompletion(soundId) {
            print("played the selected sound \(soundId)")
        }
    }
    
}

