//
//  PineSwitch.swift
//  Pods
//
//  Created by Prakash Raman on 01/03/16.
//
//

import UIKit
import Foundation

public class PineSwitch: UISwitch {
    
    public var label = PineLabel()
    
    public init(text: String) {
        super.init(frame: CGRect.zero)
        self.label.text = text
        setup()
        style()
    }
    
    convenience public init(){
        self.init(text:  "")
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        self.addSubview(self.label)
        self.label.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(self.snp_right).offset(15)
            make.centerY.equalTo(self)
        }
    }
    
    public func style(){
        self.onTintColor = PineConfig.Switch.onTintColor
    }
    
}