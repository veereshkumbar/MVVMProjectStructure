//
//  ErrorManager.swift
//  Insta-Stats
//
//  Created by Sumit Ghosh on 10/02/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//
// harsh srivastava
import UIKit

// call the functions to handle the error 
extension NSError {
    
    class func xcodeError(_ errorMessage: String) -> NSError {
        return NSError(domain: "Local Error", code: 1001, userInfo: [NSLocalizedDescriptionKey: errorMessage])
    }
    class func noDataError(_ errorCode: Int) -> NSError {
        return NSError(domain: "No Data found!!", code: 400, userInfo: [NSLocalizedDescriptionKey:"Sorry!!No data has been found"])
    }
    class func unknownError(_ errorCode: Int) -> NSError {
        return NSError(domain: "Something went wrong!!", code: 404, userInfo: [NSLocalizedDescriptionKey:"Something went wrong to fetch the data!!"])
    }
    
    class func serviceError(_ errorMessage: String)-> NSError{
        return NSError(domain: "Local Error", code:1001,userInfo :[NSLocalizedDescriptionKey:errorMessage])
    }
    
    class func tokenMismatch() -> NSError {
        return NSError(domain: Configuration.ERROR_DOMAIN, code: 401, userInfo: [NSLocalizedDescriptionKey: "Please provide the correct api token"])
    }

    
    class func tokenMismatch(errorCode : Int) -> NSError {
        return NSError(domain: Configuration.ERROR_DOMAIN, code: errorCode, userInfo: [NSLocalizedDescriptionKey: "Please provide the correct api token"])
    }
    class func deviceTypeError(errorCode : Int) -> NSError{
        return NSError(domain: Configuration.ERROR_DOMAIN, code: errorCode, userInfo: [NSLocalizedDescriptionKey:"Please send your device type to get the hashtag details."])
    }
    class func internalServerError(errorCode : Int) -> NSError {
        return NSError(domain: Configuration.ERROR_DOMAIN, code: errorCode, userInfo: [NSLocalizedDescriptionKey: "Internal Server Error Please try again after sometimes "])
    }
    
    class func unknownError(errorCode : Int) -> NSError {
        return NSError(domain: Configuration.ERROR_DOMAIN, code: 1001, userInfo: [NSLocalizedDescriptionKey: "Somethingwent wrong Please try again after sometimes"])
    }
    
}
