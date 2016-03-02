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

/// PineKits TextField SubClass
public class PineTextField: UITextField {
    
    let line = UIView()
    
    /// The floating text label
    public var label = PineLabel(text: "")
    
    /**
     - parameter placehoder: Placeholder and floating label
     */
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
    

    /**
     Sets up all the elements of the textfield. Do not override this method unless neccessary. Override 'func style' in order to make styling changes
    */
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
        self.font = PineConfig.Font.get(PineConfig.Font.REGULAR, size: 14)
    }
    
    /**
        Sets the bottom border color

        - parameter color: UIColor
     
        - returns "self"
    */
    public func setBottomBorderColor(color: UIColor) -> PineTextField {
        self.line.backgroundColor = color
        return self
    }
    
    /**
        Responsible for styling all the elements of the textfield. Override this method to make styling changes
    */
    public func style(){
        self.label.font = PineConfig.Font.get(PineConfig.Font.BOLD, size: 12)
        self.label.textAlignment = self.textAlignment
    }
    
    /// You know what this does :) Override if needed
    public override func editingRectForBounds(rect: CGRect) -> CGRect {
        return self.textRectForBounds(rect)
    }

    /// You know what this does :) Override if needed
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
