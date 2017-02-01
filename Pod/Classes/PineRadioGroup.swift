//
//  Button.swift
//  Petter
//
//  Created by Prakash Raman on 08/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import SnapKit

open class PineRadioGroup: PineSelectGroup {
        
    open override func createItem(_ data: Dictionary<String, AnyObject>, group: PineSelectGroup) -> UIView {
        return PineRadioGroupItem(data: data, group: self)
    }
    
}
