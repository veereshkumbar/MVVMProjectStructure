//
//  ImageDownloaderExtension.swift
//  Insta-Stats
//
//  Created by Sumit Ghosh on 21/03/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromServerURL(urlString: String, defaultImage : String?) {
        if let di = defaultImage {
            self.image = UIImage(named: di)
        }
        self.backgroundColor = UIColor.clear
        self.backgroundColor?.withAlphaComponent(0.0)
        
     let urlsession = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
        
        
        
        
      urlsession.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { ( data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                var image = UIImage(data: data!)
                URLCache.shared.removeAllCachedResponses()
                let imageData = image?.jpeg(.lowest)
                image = nil
                self.image = UIImage(data: imageData!)
            })
            
        }).resume()
        urlsession.invalidateAndCancel()
        urlsession.finishTasksAndInvalidate()
    }
}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    func jpeg(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
