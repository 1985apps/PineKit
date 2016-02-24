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
    
        let layout = PineLinearLayout(type: .Vertical, gutter: 10, alignment: .Center)
        self.view.addSubview(layout)
        layout.backgroundColor = UIColor.grayColor()
        layout.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(self.view).inset(30)
        }
        let b = PineButton(title: "hello")
        let c = PineButton(title: "Next Button")
        
        layout.addSubviews([b, c])
        
        
        b.snp_makeConstraints { (make) -> Void in
            make.width.height.equalTo(100)
        }
        
        c.snp_makeConstraints { (make) -> Void in
            make.width.height.equalTo(b)
        }
        
    }
    
}

