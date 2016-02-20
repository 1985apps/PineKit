//
//  ElementViewController.swift
//  PineKit
//
//  Created by Prakash Raman on 18/02/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import PineKit

class ElementViewController: PineBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = PineConfig.Color.red
//        self.view.layer.cornerRadius = 20
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
