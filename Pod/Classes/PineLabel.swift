//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


open class PineLabel : UILabel {
    
    open var lineSpaccing : CGFloat = 1.0 {
        didSet {
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineSpaccing
            let attributes = [NSParagraphStyleAttributeName: style]
            self.attributedText = NSAttributedString(string: self.text!, attributes: attributes)
        }
    }
    
    public init(){
        super.init(frame: CGRect.zero)
        setup()
        style()
    }
    
    convenience public init(text: String){
        self.init()
        self.text = text
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        self.font = PineConfig.Font.get(PineConfig.Font.REGULAR, size: 14)
    }
    
    // THIS FUNCTION SHOULD BE OVERRIDDEN IN CASE OF SUB CLASSES
    open func style(){
        
    }
    
}
