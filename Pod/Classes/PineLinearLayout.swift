
//  PineLinearLayout.swift
//  Pods
//
//  Created by Prakash Raman on 24/02/16.
//
//

import UIKit
import SnapKit

public enum PineLinearLayoutType {
    case vertical, horizontal
}

public enum PineLinearLayoutAlignment {
    case left, right, center
}

open class PineLinearLayout: UIView {

    var gutter : CGFloat = 0
    var alignment: PineLinearLayoutAlignment? = nil
    var addedViews : [UIView] = []

    var contentSizeRestTimer : Timer? = nil

    public init(type: PineLinearLayoutType = .vertical, gutter: CGFloat = 0, alignment: PineLinearLayoutAlignment? = nil){
        super.init(frame: CGRect.zero)
        self.gutter = gutter
        self.alignment = alignment
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func addSubview(_ view: UIView, gutter: CGFloat){
        super.addSubview(view)
        self.positionViewVertical(view, gutter: gutter)
    }

    open override func addSubview(_ view: UIView) {
        self.addSubview(view, gutter: self.gutter)
    }

    open func positionViewVertical(_ view: UIView, gutter: CGFloat){
        view.snp_makeConstraints { (make) -> Void in
            if self.subviews.count <= 1 {
                make.top.equalTo(self)
            } else {
                // -2 TO ACCESS THE ELEMENT BEFORE ITSELF (VIA ARRAY INDEX)
                make.top.equalTo(self.subviews[self.subviews.count - 2].snp_bottom).offset(gutter)
            }

            if alignment == .center {
                make.centerX.equalTo(self)
            } else if alignment == .left {
                make.left.equalTo(self)
            } else if alignment == .right {
                make.right.equalTo(self)
            }
        }

    }

    open override func layoutSubviews() {
        super.layoutSubviews()
    }

}
