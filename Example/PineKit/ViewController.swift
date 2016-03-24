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
import SwiftyJSON

class ViewController: UIViewController {
    
    var bar = UINavigationBar()
    var swipe = PineSwipeView()
    var range = PineRangeSlider(min: 1, max: 10)
    var tf = PineTextField(placeholder: "sdf")

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
        
        let items = [
            ["text": "testing", "value": true],
            ["text": "raw", "value": false],
        ]
        
        let sel = PineSelectGroup(items: items)
        sel.singleSelect = true
        self.view.addSubview(sel)
        sel.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(200)
            make.center.equalTo(self.view)
        }
        
        let m = PineJSONModel(map: JSON("[]"))

    }
    
    func open(sender: AnyObject){
        let menu = PineMenuViewController(menuView: MenuView(), rootViewController: ElementViewController())
        self.presentViewController(menu, animated: true, completion: nil)
    }
    
    func done(sender: AnyObject?){
        tf.resignFirstResponder()
    }
    
}

