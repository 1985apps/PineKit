//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


class PineLabel : UILabel {
    
    init(){
        super.init(frame: CGRect.zero)
        setup()
        style()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.font = PineConfig.Font.get(.Bold, size: 14)
    }
    
    // THIS FUNCTION SHOULD BE OVERRIDDEN IN CASE OF SUB CLASSES
    func style(){

    }
    
}
