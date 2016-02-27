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

public class PineLinearLayout: UIScrollView {

    var gutter : CGFloat = 0
    var alignment: PineLinearLayoutAlignment? = nil
    var addedViews : [UIView] = []

    var contentSizeRestTimer : NSTimer? = nil

    public init(type: PineLinearLayoutType = .Vertical, gutter: CGFloat = 0, alignment: PineLinearLayoutAlignment? = nil){
        super.init(frame: CGRect.zero)
        self.gutter = gutter
        self.alignment = alignment
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func addSubview(view: UIView, gutter: CGFloat){
        super.addSubview(view)
        self.positionViewVertical(view, gutter: gutter)
    }

    public override func addSubview(view: UIView) {
        self.addSubview(view, gutter: self.gutter)
    }

    public func positionViewVertical(view: UIView, gutter: CGFloat){
        view.snp_makeConstraints { (make) -> Void in
            if self.subviews.count <= 1 {
                make.top.equalTo(self)
            } else {
                // -2 TO ACCESS THE ELEMENT BEFORE ITSELF (VIA ARRAY INDEX)
                make.top.equalTo(self.subviews[self.subviews.count - 2].snp_bottom).offset(gutter)
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

    public override func layoutSubviews() {
        super.layoutSubviews()
        self.waitAndResetContentSize()
    }

    public func waitAndResetContentSize(){
        if contentSizeRestTimer != nil {
            contentSizeRestTimer?.invalidate()
        }
        contentSizeRestTimer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: "recalculateContentSize:", userInfo: nil, repeats: false)
    }

    public func calculateContentHeight() -> CGFloat {
        var height : CGFloat = 0
        for view in self.subviews {
            height += view.frame.height
        }
        return height - 5
    }

    public func recalculateContentSize(sender: AnyObject? = nil){
        self.contentSize = CGSize(width: self.frame.width, height: self.calculateContentHeight())
        self.contentSizeRestTimer = nil
    }

}
