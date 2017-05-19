//
//  PineTextField.swift
//  Pods
//
//  Created by Prakash Raman on 19/02/16.
//
//

import UIKit
import Foundation
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

//import Cartography

/// PineKits TextField SubClass
open class PineTextField: UITextField {
    
    let line = UIView()
    
    /// The floating text label
    open var label = PineLabel(text: "")
    
    /**
     - parameter placehoder: Placeholder and floating label
     */
    public init(placeholder: String){
        let frame = CGRect(x: 0, y: 0, width: PineConfig.TextField.width, height: PineConfig.TextField.width)
        super.init(frame: frame)
        self.contentVerticalAlignment = .bottom
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
    open func setup(){
        self.addSubview(line)

//        constrain(line) { line in
//            line.height == 1
//            line.bottom == line.superview!.bottom
//            line.width == line.superview!.width
//            line.left == line.superview!.left
//        }
        
        self.setBottomBorderColor(PineConfig.TextField.bottomBorderColor)
        
        // LABEL
        self.addSubview(self.label)
//        constrain(self.label) { label in
//            label.leading == label.superview!.leading
//            label.top == label.superview!.top
//            label.left == label.superview!.left
//            label.right == label.superview!.right
//        }
        self.label.text = ""
        self.label.textColor = PineConfig.Color.blue
        
        // EVENTS
        self.addTarget(self, action: #selector(PineTextField.onChange(_:)), for: .editingChanged)
        self.font = PineConfig.Font.get(PineConfig.Font.REGULAR, size: 14)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.onChange()
    }
    
    /**
        Sets the bottom border color

        - parameter color: UIColor
     
        - returns "self"
    */
    open func setBottomBorderColor(_ color: UIColor) -> PineTextField {
        self.line.backgroundColor = color
        return self
    }
    
    /**
        Responsible for styling all the elements of the textfield. Override this method to make styling changes
    */
    open func style(){
        self.label.font = PineConfig.Font.get(PineConfig.Font.BOLD, size: 12)
        self.label.textAlignment = self.textAlignment
    }
    
    /// You know what this does :) Override if needed
    open override func editingRect(forBounds rect: CGRect) -> CGRect {
        return self.textRect(forBounds: rect)
    }

    /// You know what this does :) Override if needed
    open override func textRect(forBounds rect: CGRect) -> CGRect {
        return rect.insetBy(dx: 0, dy: 10)
    }
    
    open func onChange(_ sender: AnyObject? = nil){
        if self.text?.characters.count < 1 {
            self.label.text = ""
        } else {
            self.label.text = self.placeholder
        }
    }

}
