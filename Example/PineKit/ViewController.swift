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
        
        setupNavBar()
        
        let button = PineButton(title: "Start Here")
        self.view.addSubview(button)
        constrain(button) { button in
            button.center == button.superview!.center
            button.width == button.superview!.width * 0.75
        }
        
        button.addTarget(self, action: "enter:", forControlEvents: .TouchUpInside)
        let text = PineTextField(placeholder: "Email Address")
        self.view.addSubview(text)
        constrain(text, button) { (text, button) -> () in
            text.top == button.bottom + 20
            text.centerX == text.superview!.centerX
            text.width == PineConfig.TextField.width
            text.height == PineConfig.TextField.height
        }
        
        
        // GRAPH
        let x = [
            ["name": "morning", "text": "Morning"],
            ["name": "morning", "text": "Afternoon"],
            ["name": "morning", "text": "Evening"],
            ["name": "morning", "text": "Night"]
        ]
        
        let y = PineBarGraphYSet(range: 0...100)
        let g = PineBarGraph(xSet: x, ySet: y)
        
        self.view.addSubview(g)
        g.frame = CGRect(x: 10, y: 50, width: self.view.frame.width - 20, height: 200)
        g.setup()
        
        g.applyLayer([30, 50, 20, 77])
        
        let items = [
            ["text": "Hello", "value": "hello", "icon": "menu"],
            ["text": "There", "value": "here", "icon": "back"]
        ]

        let t = PineTextField(placeholder: "this is here")
        t.textAlignment = .Center
        t.style()
        self.view.addSubview(t)
        
        t.snp_makeConstraints { (make) -> Void in
            make.height.equalTo(PineConfig.TextField.height)
            make.width.equalTo(250)
            make.left.equalTo(self.view).offset(10)
            make.bottom.equalTo(self.view).inset(20)
            make.height.equalTo(self.view).dividedBy(2)
        }
        
        let box = UIView()
        box.backgroundColor = UIColor.greenColor()
        self.view.addSubview(box)
        
        box.snp_makeConstraints { (make) -> Void in
            make.top.left.right.bottom.equalTo(self.view)
        }
        
    }
    
    func enter(sender: AnyObject?){
        let menu = PineMenuViewController.init(menuView: MenuView(), rootViewController: ElementViewController(), transition: PineMenuTransitionSqueeze())
        self.presentViewController(menu, animated: true, completion: nil)
        
    }
    
    func setupNavBar(){

        self.bar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: PineConfig.NavigationBar.heightWithStatusBar))
        self.view.addSubview(self.bar)
        let item = UINavigationItem(title: "Home Page")
        self.bar.pushNavigationItem(item, animated: true)
        self.bar.translucent = true
        self.bar.shadowImage = UIImage()
        self.bar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        
        item.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: "onRightClick:")
        
    }
    
    func onRightClick(sender: AnyObject?){
        print("clicked me")
        
//        self.bar.items?.last?.title = "Clicked me"
        let item = UINavigationItem(title: "I AM NEW")
        self.bar.pushNavigationItem(item, animated: true)
    }
}

