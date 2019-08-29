//
//  Configuration.swift
//  Insta-Stats
//
//  Created by Sumit Ghosh on 10/02/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//
// created by - Harsh Srivastav

//network configuration for API's
import Foundation
import UIKit

class Configuration: NSObject{
    static let BASE_URL = "http://api.gaia.globusdemos.com/instastats/"
    static let SERVER_BASE_IMAGEURL = ""
    static let DEVICE_TYPE = "2"
     static let MYFAVOURITES_URL = "http://api.panel.populartagsapp.com/favHashtags"
      static let PREFFREDLANGUAGE = "preffredLanguage"
    static let ERROR_DOMAIN = "Error Domain"
    static let DEVICE_ID:String = (UIDevice.current.identifierForVendor?.uuidString)!
    static let HASHTAGS_BASE_URL = "http://api.panel.populartagsapp.com/"
    static let VIRALBOOST_BASE_URL = "http://api.gaia.globusdemos.com/give/"
    static let API_TOKEN = "9876543210"
    static let BLACK_HAT_BASE_URL = "https://api.gaia.proceedinteractive.com/instastats/"
}
