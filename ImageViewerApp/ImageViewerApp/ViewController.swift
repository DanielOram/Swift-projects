//
//  ViewController.swift
//  ImageViewerApp
//
//  Created by Daniel Oram on 4/08/15.
//  Copyright © 2015 Danoram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        HttpHelperClass.httpGET("http://www.google.com", headers: ["text/plain; charset=UTF-8": "Content-Type"], body: "" ) { (postSucceeded: Bool, message: String) -> () in
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

