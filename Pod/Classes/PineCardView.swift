//
//  PineCardView.swift
//  Pods
//
//  Created by Prakash Raman on 30/03/16.
//
//

import UIKit

public class PineCardView: UIView {
    
    var cornerRadius: CGFloat = 2
    var shadowOffsetWidth: Int = 0
    var shadowOffsetHeight: Int = 3
    var shadowColor: UIColor? = UIColor.blackColor()
    var shadowOpacity: Float = 0.5
    
    public init(){
        super.init(frame: CGRectZero)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        self.clipsToBounds = true
        style()
    }
    
    public func style(){
        self.backgroundColor = UIColor.whiteColor()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = cornerRadius
        layer.borderColor = PineConfig.Color.grayLight.CGColor
        layer.shadowColor = UIColor.grayColor().CGColor
        layer.shadowOffset = CGSizeMake(0, 1)
        layer.shadowOpacity = 0.8;
        layer.shadowRadius = 2;
        layer.borderWidth = 1
        
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.CGPath
    }
    
}
