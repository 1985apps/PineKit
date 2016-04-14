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
        
        let ip = Picker(controller: self)
        view.addSubview(ip)
        
        ip.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.size.equalTo(80)
            
        }
        
        ip.backgroundColor = UIColor.greenColor()

    }
    
    func open(sender: AnyObject){
        let menu = PineMenuViewController(menuView: MenuView(), rootViewController: ElementViewController())
        self.presentViewController(menu, animated: true, completion: nil)
    }
    
    func done(sender: AnyObject?){
        print(balls?.getValues())
    }
    
    class Picker : PineImagePicker {
        
        override func onSelection(image image: UIImage) {
            print("yes I am selected")
        }
        
    }
    
}

