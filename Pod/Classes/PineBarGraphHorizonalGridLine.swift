//
//  PineBarGraphHorizonalGridLine.swift
//  Pods
//
//  Created by Prakash Raman on 19/02/16.
//
//

import UIKit
import Foundation
import Cartography

public class PineBarGraphHorizonalGridLine: UIView {
    
    var text = ""
    
    public init(text: String){
        super.init(frame: CGRect.zero)
        self.text = text
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        let label = PineLabel(text: self.text)
        label.font = PineConfig.Font.get(.Light, size: 11)
        self.addSubview(label)
        constrain(label, self) { label, row in
            label.top == row.top
            label.left == row.left
            label.height == row.height
            label.width == 25
        }
        
        let line = UIView()
        line.backgroundColor = UIColor.grayColor()
        self.addSubview(line)
        constrain(line, label) { (line, label) in
            line.centerY == label.centerY
            line.left == label.right
            line.right == line.superview!.right
            line.height == 1
        }
    }

}
