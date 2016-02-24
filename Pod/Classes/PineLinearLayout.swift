//
//  PineLinearLayout.swift
//  Pods
//
//  Created by Prakash Raman on 24/02/16.
//
//

import UIKit
import SnapKit

public enum PineLinearLayoutType {
    case Vertical, Horizontal
}

public enum PineLinearLayoutAlignment {
    case Left, Right, Center
}

public class PineLinearLayout: UIView {
    
    var gutter : CGFloat = 0
    var alignment: PineLinearLayoutAlignment? = nil
    
    public init(type: PineLinearLayoutType = .Vertical, gutter: CGFloat = 0, alignment: PineLinearLayoutAlignment? = nil){
        super.init(frame: CGRect.zero)
        self.gutter = gutter
        self.alignment = alignment
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func addSubview(view: UIView) {
        super.addSubview(view)
        positionViewVertical(view)
    }
    
    public func positionViewVertical(view: UIView){
        view.snp_makeConstraints { (make) -> Void in
            if self.subviews.count <= 1 {
                make.top.equalTo(self)
            } else {
                // -2 TO ACCESS THE ELEMENT BEFORE ITSELF (VIA ARRAY INDEX)
                make.top.equalTo(self.subviews[self.subviews.count - 2].snp_bottom).offset(self.gutter)
            }
            
            if alignment == .Center {
                make.centerX.equalTo(self)
            } else if alignment == .Left {
                make.left.equalTo(self)
            } else if alignment == .Right {
                make.right.equalTo(self)
            }
        }
        
    }
    

}
