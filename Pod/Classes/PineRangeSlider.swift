//
//  PineRangeSlider.swift
//  Pods
//
//  Created by Prakash Raman on 03/03/16.
//
//

import UIKit
import Foundation
import SnapKit

// A two-ball slider which returns both the upper and lower limit of the slider
public class PineRangeSlider: UIControl {
    
    public var min : CGFloat = 0
    public var max : CGFloat = 100
    
    public var minBall: UIImageView?
    public var maxBall: UIImageView?
    
    public var bar : UIView?
    public var barActive: UIView?

    // THIS IS USED TO ONLY CAPTURE THE ORIGINAL OFFSET
    var _moveByOffset : CGFloat = 0
    
    var minBallPositionConstraint: Constraint?
    var maxBallPositionConstraint: Constraint?
    
    var ballTintColor = PineConfig.Color.red

    convenience public init(){
        self.init(min: 0, max: 100)
    }
    
    public init(min: CGFloat, max: CGFloat){
        super.init(frame: CGRect.zero)
        self.min = min
        self.max = max
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        self.clipsToBounds = true
        
        self.minBall = UIImageView(image: getThumbImage())
        self.maxBall = UIImageView(image: getThumbImage())
        
        self.userInteractionEnabled = true

        self.minBall!.tintColor = self.ballTintColor
        self.maxBall!.tintColor = self.ballTintColor
        
        self.bar = getBarView()
        self.barActive = getBarActiveView()
        
        self.addSubviews([self.bar!, self.barActive!, self.minBall!, self.maxBall!])
    
        self.bar!.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.right.equalTo(self).inset(self.minBall!.frame.width / 2)
            make.height.equalTo(2)
        }
        
        self.barActive!.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self.minBall!.snp_centerX)
            make.right.equalTo(self.maxBall!.snp_centerX)
            make.height.equalTo(2)
            
        }
        
        minBall!.snp_makeConstraints { (make) -> Void in
            make.top.height.equalTo(self)
            self.minBallPositionConstraint = make.left.equalTo(0).constraint
            make.width.equalTo(minBall!.snp_height)
        }
        
        maxBall!.snp_makeConstraints { (make) -> Void in
            make.top.bottom.width.equalTo(self.minBall!)
            self.maxBallPositionConstraint = make.left.equalTo(self.snp_right).inset(maxBall!.frame.width).constraint
        }

        // PANNING
        minBall!.userInteractionEnabled = true
        maxBall!.userInteractionEnabled = true
        
        let panMin = UIPanGestureRecognizer(target: self, action: "panningMinBall:")
        minBall!.addGestureRecognizer(panMin)
        
        let panMax = UIPanGestureRecognizer(target: self, action: "panningMaxBall:")
        maxBall!.addGestureRecognizer(panMax)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    public func getBarView() -> UIView {
        let view = UIView()
        view.backgroundColor = PineConfig.Color.grayLight
        return view
    }
    
    public func getBarActiveView() -> UIView {
        let view = self.getBarView()
        view.backgroundColor = PineConfig.Color.blue
        return view
    }
    
    public func getThumbImage() -> UIImage {
        return UIImage(named: "filled-circle+black")!.imageWithRenderingMode(.AlwaysTemplate)
    }
    
    func panningMinBall(pan: UIPanGestureRecognizer){
        var move : CGFloat = 0
        if pan.state == .Began {
            self._moveByOffset = pan.locationInView(self).x - pan.locationInView(pan.view).x
        }
        move = pan.translationInView(self).x + self._moveByOffset
        
        // DOES NOT LET THE BALL GO OVER MAX; AND LESS THAN 0
        if(move + (maxBall?.frame.width)! > maxBall!.frame.origin.x) {
            move = maxBall!.frame.origin.x - (maxBall?.frame.width)!
        } else if (move < 0){
            move = 0
        }
        self.minBallPositionConstraint?.updateOffset(move)
        print(self.getValues())
    }
    
    func panningMaxBall(pan: UIPanGestureRecognizer){
        let finger = pan.locationInView(self)
        var move : CGFloat = 0
        if pan.state == .Began {
            self._moveByOffset = pan.locationInView(self).x - pan.locationInView(pan.view).x
        }
        move = pan.translationInView(self).x + self._moveByOffset
        self.maxBallPositionConstraint?.uninstall()
        
        // DOES NOT LET THE BALL GO OVER MIN; NOT MOVE OUTSIDE PARENT FRAME
        if(move < minBall!.frame.origin.x + minBall!.frame.size.width) {
            move = minBall!.frame.origin.x + minBall!.frame.size.width
        } else if (move + maxBall!.frame.width > self.frame.width) {
            move = self.frame.width - (maxBall?.frame.width)!
        }
        
        pan.view?.snp_makeConstraints(closure: { (make) -> Void in
            self.maxBallPositionConstraint = make.left.equalTo(move).constraint
        })
        
        print(self.getValues())
    }
    
    
    public func getValues() -> Dictionary<String, CGFloat> {
        let min = ((minBall?.frame.origin.x)! / self.frame.width)
        let max = ((maxBall?.frame.origin.x)! / self.frame.width)
        let rangeSize = self.max - self.min
        return  ["min" : rangeSize * min, "max": rangeSize * max]
    }

    
}
