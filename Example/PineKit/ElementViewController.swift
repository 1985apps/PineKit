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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func preferredRightButton() -> UIImage {
        return UIImage(named: "menu")!
    }
    
    override func preferredRightButtonTarget(_ sender: AnyObject) {
        print("you clicked me")
    }
    
    override func preferredTitleView() -> UIView? {
        return UIImageView(image: UIImage(named: "menu"))
    }

}
