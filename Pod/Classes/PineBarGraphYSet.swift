//
//  PineBarGraphXSet.swift
//  Pods
//
//  Created by Prakash Raman on 19/02/16.
//
//

import UIKit

public class PineBarGraphYSet: NSObject {
    
    var range : Range<Int> = 0...0
    var labels : [String] = []

    public init(range: Range<Int>, labels: [String] = []){
        super.init()
        self.range = range
        self.labels = labels
    }
    
}
