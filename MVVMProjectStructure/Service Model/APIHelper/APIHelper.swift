//
//  APIHelper.swift//  Insta-Stats
//
//  Created by Sumit Ghosh on 14/02/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//

import UIKit

class APIHelper: NSObject {
    static let shareinstance = APIHelper()
   //for POST Request
    /*
    //MARK: GEt Likes Stats
    func getPackageDeails(dataDict:[String:AnyObject],completionHandler: @escaping(allPackages?, Error?) -> Void) -> Void{
        
        let url = URL(string: "\(Configuration.VIRALBOOST_BASE_URL)package")
        
        let bodyString = escapedParameters(dataDict)
        
        URlSessionManager.share.postRequest(with: url!, body: bodyString) { (data, error) in
            if error != nil {
                completionHandler(nil, error)
            }
            else {
                do {
                    let response = try JSONDecoder().decode(allPackages.self, from: data! as Data)
                    completionHandler(response, error)
                } catch let error {
                    print(error)
                }
            }
        }
    }
    */
    
    //for GET Request
    
    /*
    //MARK: get Data from Instagram
    func getInstagramData(access_token: String,completionHandler: @escaping(InstaModel?, Error?) -> Void) -> Void{
        
        let urlString = "\(InstagramModel.INSTAGRAM_GETURL)\(access_token)"
        let url = URL.init(string: urlString)
        
        URlSessionManager.share.getRequestForInstagram(with: url!) { (data, error) in
            if error != nil {
                completionHandler(nil, error)
            }
            else {
                do {
                    let response = try JSONDecoder().decode(InstaModel.self, from: data! as Data)
                    completionHandler(response, error)
                } catch let error {
                    print(error)
                }
            }
        }
    }
    */

}
