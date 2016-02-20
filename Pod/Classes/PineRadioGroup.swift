//
//  Button.swift
//  Petter
//
//  Created by Prakash Raman on 08/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import SnapKit

public class PineRadioGroup: PineSelectGroup {
        
    public override func createItem(data: Dictionary<String, String>, group: PineSelectGroup) -> UIView {
        return PineRadioGroupItem(data: data, group: self)
    }
    
}