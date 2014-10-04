//
//  ViewController.swift
//  BLEChat
//
//  Created by Ankush Agrawal on 10/3/14.
//  Copyright (c) 2014 AnkushAgrawal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var username: NSString?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(username)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func tap(sender: AnyObject) {
        println("before push")
        self.navigationController?.pushViewController(ConnectionsViewController(), animated: true)
        println("after push")
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        //self.navigationController?.pushViewController(FirstViewController(), animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let firstVC:FirstViewController = segue.destinationViewController as FirstViewController
        
        firstVC.username = username
        //segue.destinationViewController.username = username
    }
}

