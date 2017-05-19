//
//  PineJSONModel.swift
//  Petter
//
//  Created by Prakash Raman on 24/03/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import SwiftyJSON

open class PineJSONModel: NSObject {
    
    open var _map : JSON = JSON("[]")
    
    public init(map: JSON){
        super.init()
        self._map = map
        self.map()
    }
    
    open func map() {
         
    }
    
    open func pull(_ key: String) -> JSON {
        return _map[key]
    }
    
}
