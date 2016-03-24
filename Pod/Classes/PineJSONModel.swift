//
//  PineJSONModel.swift
//  Petter
//
//  Created by Prakash Raman on 24/03/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import SwiftyJSON

public class PineJSONModel: NSObject {
    
    public var _map : JSON = JSON("[]")
    
    public init(map: JSON){
        super.init()
        self._map = map
        self.map()
    }
    
    public func map() {
        
    }
    
}
