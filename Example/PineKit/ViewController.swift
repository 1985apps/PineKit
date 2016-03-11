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
    var range = PineRangeSlider(min: 1, max: 10)

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
        
        self.view.addSubview(range)
        range.snp_makeConstraints { (make) -> Void in
            make.center.equalTo(self.view)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        let b = PineButton(title: "Move")
        self.view.addSubview(b)
        b.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(100)
            make.height.width.equalTo(100)
        }
        
        b.addTarget(self, action: "move:", forControlEvents: .TouchUpInside)
        
        let thumb = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 20))
        thumb.backgroundColor = UIColor.grayColor()
        
//        let seg = PineSegmentedControl(labels: ["one", "two", "three", "four"], thumbview: thumb)
        let seg = PineSegmentedControl(labels: ["1", "2", "3"], thumbview: thumb) { segment in
            print(segment.active)
        }

        self.view.addSubview(seg)
        seg.snp_makeConstraints { (make) -> Void in
            make.bottom.left.right.equalTo(self.view).inset(20)
            make.height.equalTo(70)
        }
        seg.backgroundColor = UIColor.greenColor()
        
    }
    
    func open(sender: AnyObject){
        let menu = PineMenuViewController(menuView: MenuView(), rootViewController: ElementViewController())
        self.presentViewController(menu, animated: true, completion: nil)
    }

    func move(sender: AnyObject?){
        range.setMinBallValue(3)
    }
    
}

