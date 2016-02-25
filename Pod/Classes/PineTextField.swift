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
    public var label = PineLabel(text: "")
    
    public init(placeholder: String){
        let frame = CGRect(x: 0, y: 0, width: PineConfig.TextField.width, height: PineConfig.TextField.width)
        super.init(frame: frame)
        self.contentVerticalAlignment = .Bottom
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
            label.right == label.superview!.right
        }
        self.label.text = ""
        self.label.textColor = PineConfig.Color.blue
        
        // EVENTS
        self.addTarget(self, action: "onChange:", forControlEvents: .EditingChanged)
        self.addTarget(self, action: "onBlur:", forControlEvents: .EditingDidEnd)
        
    }
    
    public func setBottomBorderColor(color: UIColor) -> PineTextField {
        self.line.backgroundColor = color
        return self
    }
    
    public func style(){
        self.label.font = PineConfig.Font.get(PineConfig.Font.BOLD, size: 12)
        self.label.textAlignment = self.textAlignment
    }
    
    public override func editingRectForBounds(rect: CGRect) -> CGRect {
        return self.textRectForBounds(rect)
    }

    public override func textRectForBounds(rect: CGRect) -> CGRect {
        return CGRectInset(rect, 0, 10)
    }
    
    func onChange(sender: AnyObject?){
        if self.text?.characters.count < 1 {
            self.label.text = ""
        } else {
            self.label.text = self.placeholder
        }
    }

}
