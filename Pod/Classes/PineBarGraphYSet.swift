//
//  PineBarGraphXSet.swift
//  Pods
//
//  Created by Prakash Raman on 19/02/16.
//
//

import UIKit

open class PineBarGraphYSet: NSObject {
    
    var range : CountableClosedRange<Int> = 0...0
    var labels : [String] = []

    public init(range: CountableClosedRange<Int>, labels: [String] = []){
        super.init()
        self.range = range
        self.labels = labels
    }
    
}
