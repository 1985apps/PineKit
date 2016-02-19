//
//  BarGraph.swift
//  Pods
//
//  Created by Prakash Raman on 19/02/16.
//
//

import UIKit
import Foundation
import Cartography

public class PineBarGraph: UIView {
    
    var yDivisions = 5
    
    var ySet: PineBarGraphYSet?
    let labelsView = UIView()
    
    public init(ySet: PineBarGraphYSet){
        super.init(frame: CGRect.zero)
        self.ySet = ySet
        
//        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        setupLabels()
        
//        self.backgroundColor = PineConfig.Color.red
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 1
        
        setupYAxis()
    }
    
    func setupLabels(){
        
        self.addSubview(self.labelsView)
        labelsView.backgroundColor = UIColor.grayColor()
        labelsView.layer.borderWidth = 1
        labelsView.layer.borderColor = UIColor.blackColor().CGColor
        
        print(self.frame.size.height)
        var frame = self.frame
        frame.size.height = 40
        frame.origin.y = self.frame.size.height - frame.height
        frame.origin.x = 30
        frame.size.width = frame.width - frame.origin.x
        labelsView.frame = frame
        print(frame)
        
        let count : CGFloat = CGFloat(self.ySet!.labels.count)
        let labelWidth = frame.width / count
        var x : CGFloat = 0
        
        print(labelsView.frame.width)
        for (index, label) in (self.ySet?.labels)!.enumerate() {
            let l = PineLabel(text: label)
            l.textAlignment = .Center
            labelsView.addSubview(l)
            let f = CGRect(x: x, y: 0, width: labelWidth, height: frame.height)
            l.frame = f
            x = x + labelWidth
        }
    }
    
    func setupYAxis(){
        let r = self.ySet?.range
        let sectionSize = ((r?.endIndex)! - (r?.startIndex)!) / yDivisions
        print(sectionSize)
    }

}
