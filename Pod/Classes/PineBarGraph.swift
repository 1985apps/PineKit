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
    
    var yDivisions : CGFloat = 5
    var axisMargin = 20
    
    var xSet : [Dictionary<String, String>] = []
    var ySet : PineBarGraphYSet?
    
    let labelsView = UIView()
    let yAxisView = UIView()
    
    public init(xSet: [Dictionary<String, String>], ySet: PineBarGraphYSet){
        super.init(frame: CGRect.zero)
        self.ySet = ySet
        self.xSet = xSet
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        setupXAxis()
        setupYAxis()
    }
    
    func setupXAxis(){
        
        self.addSubview(self.labelsView)

        var frame = self.frame
        frame.size.height = 20
        frame.origin.y = self.frame.size.height - frame.height
        frame.origin.x = CGFloat(self.axisMargin)
        frame.size.width = frame.width - frame.origin.x
        labelsView.frame = frame
        
        let count : CGFloat = CGFloat(self.xSet.count)
        let labelWidth = frame.width / count
        var x : CGFloat = 0
        
        print(labelsView.frame.width)
        for item in self.xSet {
            let label = item["text"]!
            let l = PineLabel(text: label)
            l.font = PineConfig.Font.get(.Light, size: 11)
            l.textAlignment = .Center
            labelsView.addSubview(l)
            let f = CGRect(x: x, y: 0, width: labelWidth, height: frame.height)
            l.frame = f
            x = x + labelWidth
        }
    }
    
    func setupYAxis(){
        let r = self.ySet?.range
        let sectionSize = ((r?.endIndex)! - (r?.startIndex)!) / Int(yDivisions)
        print(sectionSize)
        
        self.addSubview(yAxisView)
        self.yAxisView.frame = CGRect(x: 0, y: 0, width:CGFloat(self.axisMargin), height: self.frame.height - 30)
        
        var y = yAxisView.frame.height
        let sectionHeight = yAxisView.frame.height / yDivisions
        var value = Int((r?.startIndex)!)
        
        for _ in 0...(Int(self.yDivisions) - 1) {
            let line = PineBarGraphHorizonalGridLine(text: String(value))
            self.addSubview(line)
            
            line.frame = CGRect(x: 0, y: y, width: self.frame.width, height: 10)
            
            y = y - sectionHeight
            value = value + sectionSize
        }
        
    }

}
