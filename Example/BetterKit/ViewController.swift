//
//  ViewController.swift
//  BetterKit
//
//  Created by Janglinator on 03/15/2018.
//  Copyright (c) 2018 Janglinator. All rights reserved.
//

import UIKit
import BetterKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NSLog("viewWillAppear")
    }

    override func viewWillFirstAppear(_ animated: Bool) {
        super.viewWillFirstAppear(animated)
        
        NSLog("viewWillFirstAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NSLog("viewDidAppear")
    }
    
    override func viewDidFirstAppear(_ animated: Bool) {
        super.viewDidFirstAppear(animated)
        
        NSLog("viewDidFirstAppear")
    }
}

