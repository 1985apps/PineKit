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
        let b = PineButton(title: "this is it")
        self.view.addSubview(b)
        b.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self.view).inset(20)
            make.height.equalTo(50)
        }
        
        b.addTarget(self, action: "open:", forControlEvents: .TouchUpInside)
        
        let s = PineSwitch(text: "Show nofitications every day")
        self.view.addSubview(s)
        s.snp_makeConstraints { (make) -> Void in
            make.top.left.equalTo(self.view).offset(30)
        }
        

        let slider = PineRangeSlider(min: 40, max: 50) { (slider) -> Void in
            print(slider.getValues())
            print(slider.getValues().min)
        }
        
        self.view.addSubview(slider)
        slider.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(32)
        }
        
    }
    
    func open(sender: AnyObject){
        let menu = PineMenuViewController(menuView: MenuView(), rootViewController: ElementViewController())
        self.presentViewController(menu, animated: true, completion: nil)
    }
    
}

