//
//  PineTextField.swift
//  Pods
//
//  Created by Prakash Raman on 19/02/16.
//
//

import UIKit
import Foundation
import Cartography

public class PineTextField: UITextField {
    
    let line = UIView()
    var label = PineLabel(text: "")
    
    public init(placeholder: String){
        let frame = CGRect(x: 0, y: 0, width: PineConfig.TextField.width, height: PineConfig.TextField.width)
        super.init(frame: frame)
        self.placeholder = placeholder
        self.setup()
        self.style()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        self.addSubview(line)

        constrain(line) { line in
            line.height == 1
            line.bottom == line.superview!.bottom
            line.width == line.superview!.width
            line.left == line.superview!.left
        }
        
        self.setBottomBorderColor(PineConfig.TextField.bottomBorderColor)
        
        // LABEL
        self.addSubview(self.label)
        constrain(self.label) { label in
            label.leading == label.superview!.leading
            label.top == label.superview!.top
            label.left == label.superview!.left
        }
        self.label.text = ""
        
        // EVENTS
        self.addTarget(self, action: "onChange:", forControlEvents: .EditingChanged)
        self.addTarget(self, action: "onBlur:", forControlEvents: .EditingDidEnd)
        
    }
    
    public func setBottomBorderColor(color: UIColor) -> PineTextField {
        self.line.backgroundColor = color
        return self
    }
    
    public func style(){
        
    }
    
    func onChange(sender: AnyObject?){
        if self.text?.characters.count < 1 {
            self.label.text = ""
        } else {
            self.label.text = self.placeholder
            self.label.textColor = PineConfig.Color.blue
        }
    }

    func onBlur(sender: AnyObject?){
        self.label.textColor = PineConfig.Color.grayLight
    }
}
