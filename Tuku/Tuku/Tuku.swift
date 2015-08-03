//
//  Tuku.swift
//  Tuku
//
//  Created by Daniel Oram on 3/08/15.
//  Copyright (c) 2015 Danoram. All rights reserved.
//

import Foundation

//This Framework contains methods for making http requests in order to simplify debugging.
//made it a structure in order to make static methods

//only GET POST and PUT implemented at present


/*
//example http GET request
Tuku.httpGET("http://www.google.com", headers: ["": ""], body: "" ) { (postSucceeded: Bool, message: String) -> () in
var alert = UIAlertView(title: "request sent!", message: message, delegate: nil, cancelButtonTitle: "Okay.")

// Move to the UI thread
dispatch_async(dispatch_get_main_queue(), { () -> Void in
// Show the alert
alert.show()
})
}
*/

public struct Tuku {
    
    //each function takes 3-4 parameters: the URL string , request headers in dictionary form, the message body, and an optional function that can be used for debugging purposes or to implement an action or debugging message after a request is sent.
    
    public static func httpGET(url: String, headers: [String: String], body: String) {
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
            println("Error making GET request!")
        }
        task.resume()
    }
    
    
    public static func httpGET(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
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
    
    public static func httpPOST(url: String, headers: [String: String], body: String) {
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
            println("Error making POST request!")
        }
        task.resume()
    }
    
    public static func httpPOST(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
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
    
    public static func httpPUT(url: String, headers: [String: String], body: String) {
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
            println("Error making PUT request!")
        }
        task.resume()
    }
    
    public static func httpPUT(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
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