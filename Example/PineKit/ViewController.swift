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
    
    var bar = UINavigationBar()
    var swipe = PineSwipeView()

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
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v1.backgroundColor = UIColor.blueColor()
        v2.backgroundColor = UIColor.redColor()
        v3.backgroundColor = UIColor.greenColor()
        
        swipe = PineSwipeView(stages: [v1, v2, v3]) { (stage) -> Void in
            print("@ \(stage)")
        }
        self.view.addSubview(swipe)
        
        swipe.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        let b = PineButton(title: "Back")
        self.view.addSubview(b)
        b.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.view)
            make.top.equalTo(100)
            make.width.height.equalTo(100)
        }
        b.addTarget(self, action: "go:", forControlEvents: .TouchUpInside)
    }
    
    func open(sender: AnyObject){
        let menu = PineMenuViewController(menuView: MenuView(), rootViewController: ElementViewController())
        self.presentViewController(menu, animated: true, completion: nil)
    }
    
    func go(sender: AnyObject?){
        swipe.back()
    }
    
}

