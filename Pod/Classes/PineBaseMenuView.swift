//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


open class PineBaseMenuView : UIView {
    
    open var delegate : PineMenuDelegate?
    
    public init(){
        super.init(frame: CGRect.zero)
        setup()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(){
        self.backgroundColor = UIColor.green
        let b = PineButton(title: "Call")
        self.addSubview(b)

        b.addTarget(self, action: #selector(PineBaseMenuView.callme(_:)), for: .touchUpInside)
    }

    func callme(_ sender: AnyObject?){
//        self.delegate?.loadContentViewController(ViewController2())
    }
    
}
