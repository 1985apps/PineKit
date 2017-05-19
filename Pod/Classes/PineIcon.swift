//
//  Button.swift
//  Petter
//
//  Created by Prakash Raman on 08/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import SnapKit

open class PineIcon: UIImageView {
        
    var named : String = "1x1"
    
    public init(named name: String){
        super.init(frame: CGRect.zero)
        self.image = UIImage(named: name)
        self.contentMode = UIViewContentMode.center
        self.named = name
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func change(named name: String){
        self.named = name
        self.image = UIImage(named: name)
    }
}
