//
//  URLSessionManager.swift
//  Insta-Stats
//
//  Created by Sumit Ghosh on 10/02/18.
//  Copyright © 2018 Sumit Ghosh. All rights reserved.
//
// Harsh Srivastava
import UIKit

class URLSessionManager: NSObject {
    static let share = URLSessionManager()
    
    private func configureDefaultSession() -> URLSessionConfiguration {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 30.0
        sessionConfig.timeoutIntervalForResource = 60.0
        return sessionConfig
    }
    
    private func configureBackgroundSession(_ identifier: String) -> URLSessionConfiguration {
        let sessionConfig = URLSessionConfiguration.background(withIdentifier: identifier)
        return sessionConfig
    }
    
    private func getSharedSession() -> URLSession {
        let configuration = self.configureDefaultSession()
        let session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        return session
    }
    
    // Mark: Post requset
    
    func postRequest(with url: URL, body: String, completionHandler: @escaping (Data?, NSError?) -> Void) -> Void {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = body.data(using: .utf8)
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                completionHandler(nil, NSError.xcodeError(error!.localizedDescription))
                return
            }
            
            let httpResponse: HTTPURLResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                completionHandler(data, nil)
            }else if httpResponse.statusCode == 400 {
                completionHandler(nil, NSError.noDataError(httpResponse.statusCode))
            }else{
                completionHandler(nil, NSError.unknownError(httpResponse.statusCode))
            }
            }.resume()
    }
    
    
    // Mark: Get requset
    
    func getRequest(with url: URL, completionHandler: @escaping (Data?, NSError?) -> Void) -> Void {
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        self.getSharedSession().dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                completionHandler(nil, NSError.xcodeError(error!.localizedDescription))
                return
            }
            
            let httpResponse: HTTPURLResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 200 {
                
                completionHandler(data, nil)
            }
            }.resume()
    }
}

extension URLSessionManager: URLSessionDelegate {
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
        
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
    }
}
