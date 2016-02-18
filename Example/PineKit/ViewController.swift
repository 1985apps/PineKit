//
//  ViewController.swift
//  PineKit
//
//  Created by Prakash Raman on 02/18/2016.
//  Copyright (c) 2016 Prakash Raman. All rights reserved.
//

import UIKit
import Cartography
import PineKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        let button = PineButton(title: "Start Here")
        self.view.addSubview(button)
        constrain(button) { button in
            button.center == button.superview!.center
            button.width == button.superview!.width * 0.75
        }
        
        button.addTarget(self, action: "enter:", forControlEvents: .TouchUpInside)
    }
    
    func enter(sender: AnyObject?){
        let menu = PineMenuViewController.init(menuView: MenuView(), rootViewController: ElementViewController())
        self.presentViewController(menu, animated: true, completion: nil)
    }
}

