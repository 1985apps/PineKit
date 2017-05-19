//
//  Button.swift
//  Petter
//
//  Created by Prakash Raman on 08/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import SnapKit

open class PineRadioGroupItem : PineSelectGroupItem {
        
    open override func beforeUpdate() -> PineSelectGroupItem {
        for item in self.group!.items {
            if let obj = item as? PineRadioGroupItem {
                // DIACTIVATES ALL THE ITEMS
                obj.set(state: PineSelectGroupItem.State.inactive).update()
            }
        }
        self.set(state: State.active)
        return self
    }
    
    open override func update() {
        self.label.text = self.text
        let iconname = self.isActive() ? "radio_button_active" : "radio_button_inactive"
        self.icon.change(named: iconname)
    }
    
}
