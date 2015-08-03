//
//  HttpHelperClass.swift
//  Tomato
//
//  Created by Daniel Oram on 23/04/15.
//  Copyright (c) 2015 Danoram. All rights reserved.
//

import Foundation

//This struct will contain methods for making all relevant http request types in order to simplify debugging.
//made it a structure in order to make static methods

//only GET POST and PUT needed at present


/*
//example http GET request
HttpHelperClass.httpGET("http://www.google.com", headers: ["": ""], body: "" ) { (postSucceeded: Bool, message: String) -> () in
var alert = UIAlertView(title: "request sent!", message: message, delegate: nil, cancelButtonTitle: "Okay.")

// Move to the UI thread
dispatch_async(dispatch_get_main_queue(), { () -> Void in
// Show the alert
alert.show()
})
}
*/

struct HttpHelperClass {
    
    static func httpGET(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "GET"
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
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
    
    static func httpPOST(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "POST"
        
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
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
    
    static func httpPUT(url: String, headers: [String: String], body: String, postSucceded: (success: Bool, message: String) -> ()){
        //create request from url param
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "PUT"
        
        request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
        
        //set headers
        for header in headers {
            request.setValue(header.0, forHTTPHeaderField: header.1)
        }
        
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