//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


class PineButton : UIButton {
    
    init(title: String){
        super.init(frame: CGRect.zero)
        self.setTitle(title, forState: .Normal)
        setup()
        style()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.backgroundColor = PineConfig.Color.red
        self.layer.cornerRadius = 2
        self.titleLabel?.font = PineConfig.Font.get(.Bold, size: 14)
    }
    
    // THIS FUNCTION SHOULD BE OVERRIDDEN IN CASE OF SUB CLASSES
    func style(){

    }
    
    
    // Hollow Button
    class Hollow : PineButton {
        
        override func style(){
            super.style()
            self.backgroundColor = UIColor.clearColor()
            self.layer.borderWidth = 1
            self.layer.borderColor = PineConfig.Color.cream.CGColor
        }
        
    }
    
}
