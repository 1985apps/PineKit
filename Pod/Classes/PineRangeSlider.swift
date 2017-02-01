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
open class PineRangeSlider: UIControl {
    
    open var min : CGFloat = 0
    open var max : CGFloat = 100
    open var seed : (min: CGFloat, max: CGFloat)? = nil
    
    open var minBall: UIImageView?
    open var maxBall: UIImageView?
    
    open var bar : UIView?
    open var barActive: UIView?
    
    open var onChange : (PineRangeSlider) -> Void = {_ in }

    // THIS IS USED TO ONLY CAPTURE THE ORIGINAL OFFSET
    var _moveByOffset : CGFloat = 0
    
    var minBallPositionConstraint: Constraint?
    var maxBallPositionConstraint: Constraint?
    
    var ballTintColor = PineConfig.Color.red

    convenience public init(){
        self.init(min: 0, max: 100)
    }
    
    public init(min: CGFloat, max: CGFloat, onChange: @escaping ((PineRangeSlider) -> Void) = {_ in} ){
        super.init(frame: CGRect.zero)
        self.min = min
        self.max = max
        self.onChange = onChange
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(){
        self.clipsToBounds = true
        
        self.minBall = UIImageView(image: preferredThumbImage())
        self.maxBall = UIImageView(image: preferredThumbImage())
        
        self.isUserInteractionEnabled = true

        self.minBall!.tintColor = self.ballTintColor
        self.maxBall!.tintColor = self.ballTintColor
        
        self.bar = preferredBarView()
        self.barActive = preferredBarActiveView()
        
        self.addSubviews([self.bar!, self.barActive!, self.minBall!, self.maxBall!])
    
        self.bar!.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.right.equalTo(self).inset(self.minBall!.frame.width / 2)
            make.height.equalTo(self.preferredBarHeight())
        }
        
        self.barActive!.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self)
            make.left.equalTo(self.minBall!.snp_centerX)
            make.right.equalTo(self.maxBall!.snp_centerX)
            make.height.equalTo(self.bar!)
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
        minBall!.isUserInteractionEnabled = true
        maxBall!.isUserInteractionEnabled = true
        
        let panMin = UIPanGestureRecognizer(target: self, action: #selector(PineRangeSlider.panningMinBall(_:)))
        minBall!.addGestureRecognizer(panMin)
        
        let panMax = UIPanGestureRecognizer(target: self, action: #selector(PineRangeSlider.panningMaxBall(_:)))
        maxBall!.addGestureRecognizer(panMax)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        // THIS SHOULD RUN ONLY ONCE
        if let s = seed {
            let xs = getXForValues(s.min, max: s.max)
            self.minBallPositionConstraint?.updateOffset(amount: xs.min)
            self.maxBallPositionConstraint?.uninstall()
            maxBall?.snp_makeConstraints({ (make) in
                self.maxBallPositionConstraint = make.left.equalTo(xs.max - (maxBall?.frame.width)!).constraint
            })
            self.seed = nil
        }
    }
    
    open func preferredBarView() -> UIView {
        let view = UIView()
        view.backgroundColor = PineConfig.Color.grayLight
        return view
    }
    
    open func preferredBarActiveView() -> UIView {
        let view = self.preferredBarView()
        view.backgroundColor = PineConfig.Color.blue
        return view
    }
    
    open func preferredThumbImage() -> UIImage {
        return UIImage(named: "filled-circle+black")!.withRenderingMode(.alwaysTemplate)
    }
    
    open func preferredBarHeight() -> CGFloat {
        return 2
    }
    
    func panningMinBall(_ pan: UIPanGestureRecognizer){
        var move : CGFloat = 0
        if pan.state == .began {
            self._moveByOffset = pan.location(in: self).x - pan.location(in: pan.view).x
        }
        move = pan.translation(in: self).x + self._moveByOffset
        
        // DOES NOT LET THE BALL GO OVER MAX; AND LESS THAN 0
        if(move + (maxBall?.frame.width)! > maxBall!.frame.origin.x) {
            move = maxBall!.frame.origin.x - (maxBall?.frame.width)!
        } else if (move < 0){
            move = 0
        }
        self.minBallPositionConstraint?.updateOffset(amount: move)
        self.onChange(self)
    }
    
    public func setMinBallValue(_ move: CGFloat){
        var move = move
        // DOES NOT LET THE BALL GO OVER MAX; AND LESS THAN 0
        if(move + (maxBall?.frame.width)! > maxBall!.frame.origin.x) {
            move = maxBall!.frame.origin.x - (maxBall?.frame.width)!
        } else if (move < 0){
            move = 0
        }
        self.minBallPositionConstraint?.updateOffset(amount: move)
    }
    
    func panningMaxBall(_ pan: UIPanGestureRecognizer){
        var move : CGFloat = 0
        if pan.state == .began {
            self._moveByOffset = pan.location(in: self).x - pan.location(in: pan.view).x
        }
        move = pan.translation(in: self).x + self._moveByOffset
        self.maxBallPositionConstraint?.uninstall()
        
        // DOES NOT LET THE BALL GO OVER MIN; NOT MOVE OUTSIDE PARENT FRAME
        if(move < minBall!.frame.origin.x + minBall!.frame.size.width) {
            move = minBall!.frame.origin.x + minBall!.frame.size.width
        } else if (move + maxBall!.frame.width > self.frame.width) {
            move = self.frame.width - (maxBall?.frame.width)!
        }
        
        pan.view?.snp_makeConstraints({ (make) -> Void in
            self.maxBallPositionConstraint = make.left.equalTo(move).constraint
        })
        
        self.onChange(self)
    }
    
    
    open func getValues() -> (min: CGFloat, max: CGFloat) {
        let min = ((minBall?.frame.origin.x)! / self.frame.width)
        let max = (((maxBall?.frame.origin.x)! + (maxBall?.frame.width)!) / self.frame.width)
        let rangeSize = self.max - self.min
        return (min: (self.min + rangeSize * min), max: (self.min + rangeSize * max))
    }
    
    open func setDefaultValues(min: CGFloat, max: CGFloat){
        self.seed = (min, max)
    }
    
    func getXForValues(_ min: CGFloat, max: CGFloat) -> (min: CGFloat, max: CGFloat){
        let rangeSize = self.max - self.min
        let minPc = (100 * (min - self.min)) / rangeSize
        let maxPc = (100 * (max - self.min)) / rangeSize
        
        let minX = self.frame.width * minPc / 100
        let maxX = self.frame.width * maxPc / 100
        return (minX, maxX)
    }
    
}
