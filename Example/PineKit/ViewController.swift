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
import BSImagePicker
import Photos

class ViewController: UIViewController {
    
    var bar = UINavigationBar()
    var swipe = PineSwipeView()
    var range = PineRangeSlider(min: 1, max: 10)
    var tf = PineTextField(placeholder: "sdf")
    
    var balls : PineRangeSlider? = nil

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
        var tf = PineTextField(placeholder: "this is it")
        self.view.addSubview(tf)
        
        tf.snp_makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.height.equalTo(40)
            make.width.equalTo(200)
        }
        
        tf.text = "this could there already"
//        tf.onChange()
    }
    
}

