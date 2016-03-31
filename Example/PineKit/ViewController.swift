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
        balls = PineRangeSlider(min: 20, max: 40) { (ball) in
            print(ball.getValues())
        }
        view.addSubview(balls!)
        balls!.snp_makeConstraints { (make) in
            make.center.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.60)
            make.height.equalTo(35)
        }
        
        balls!.setDefaultValues(min: 25, max: 40)
        
        let b = PineButton(title: "Click")
        view.addSubview(b)
        b.snp_makeConstraints { (make) in
            make.left.right.bottom.equalTo(view).inset(25)
            make.height.equalTo(50)
        }
        
        b.addTarget(self, action: #selector(self.done(_:)), forControlEvents: .TouchUpInside)
    }
    
    func open(sender: AnyObject){
        let menu = PineMenuViewController(menuView: MenuView(), rootViewController: ElementViewController())
        self.presentViewController(menu, animated: true, completion: nil)
    }
    
    func done(sender: AnyObject?){
        print(balls?.getValues())
    }
    
}

