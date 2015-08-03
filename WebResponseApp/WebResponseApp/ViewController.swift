//
//  ViewController.swift
//  WebResponseApp
//
//  Created by Daniel Oram on 3/08/15.
//  Copyright (c) 2015 Danoram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    //example http GET request
    WebResponseModel.httpGET("http://www.google.com", headers: ["": ""], body: "" ) { (postSucceeded: Bool, message: String) -> () in
    var alert = UIAlertView(title: "request sent!", message: message, delegate: nil, cancelButtonTitle: "Okay.")
    
    // Move to the UI thread
    dispatch_async(dispatch_get_main_queue(), { () -> Void in
    // Show the alert
    alert.show()
    })
    }
    */

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        WebResponseModel.httpGET("http://www.google.com", headers: ["": ""], body: "" ) { (postSucceeded: Bool, message: String) -> () in
            let alert = UIAlertView(title: "request sent!", message: message, delegate: nil, cancelButtonTitle: "Okay.")
            
            // Move to the UI thread
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                // Show the alert
                alert.show()
            })
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

