//
//  WebResponseModel.swift
//  WebResponseApp
//
//  Created by Daniel Oram on 3/08/15.
//  Copyright (c) 2015 Danoram. All rights reserved.
//

import Foundation

public class WebResponseModel {
    
    //each function takes 3-4 parameters: the URL string , request headers in dictionary form, the message body, and an optional function that can be used for debugging purposes or to implement an action or debugging message after a request is sent.
    
    public class func httpGET(url: String, headers: [String: String], body: String) {
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "GET"
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
        //set request body
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
        //send http request
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                return
            }
            print("Error making GET request!")
        }
        task.resume()
    }
    
    
    public class func httpGET(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "GET"
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
        //set request body
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
        //send http request
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                postSucceded(success: false, message: "\(error)")
                return
            }
            postSucceded(success: true, message: "\(response)")
            
        }
        task.resume()
    }
    
    public class func httpPOST(url: String, headers: [String: String], body: String) {
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
        //set request body
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
        //send http request
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                return
            }
            print("Error making POST request!")
        }
        task.resume()
    }
    
    public class func httpPOST(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        
        //set request body
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
        //send http request
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                postSucceded(success: false, message: "\(error)")
                return
            }
            postSucceded(success: true, message: "\(response)")
            
        }
        task.resume()
    }
    
    public class func httpPUT(url: String, headers: [String: String], body: String) {
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "PUT"
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
        //set request body
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
        //send http request
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                return
            }
            print("Error making PUT request!")
        }
        task.resume()
    }
    
    public class func httpPUT(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "PUT"
        
        //set request body
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
        //send http request
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            if error != nil {
                postSucceded(success: false, message: "\(error)")
                return
            }
            postSucceded(success: true, message: "\(response)")
            
        }
        task.resume()
    }
}