//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit

open class PineButton : UIButton {
    
    public init(title: String){
        super.init(frame: CGRect.zero)
        self.setTitle(title, for: UIControlState())
        setup()
        style()
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.backgroundColor = PineConfig.Color.red
        self.layer.cornerRadius = 2
        self.titleLabel?.font = PineConfig.Font.get(PineConfig.Font.BOLD, size: 14)
    }
    
    // THIS FUNCTION SHOULD BE OVERRIDDEN IN CASE OF SUB CLASSES
    open func style(){

    }
    
    
    // Hollow Button
    open class Hollow : PineButton {
        
        override open func style(){
            super.style()
            self.backgroundColor = UIColor.clear
            self.layer.borderWidth = 1
            self.layer.borderColor = PineConfig.Color.cream.cgColor
            self.setTitleColor(PineConfig.Color.cream, for: UIControlState())
        }
        
    }
    
}
