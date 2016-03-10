//
//  PineSwipeView.swift
//  Pods
//
//  Created by Prakash Raman on 24/02/16.
//
//

import UIKit
import Foundation

public class PineSwipeView: UIView {
    
    public var stages : [UIView] = []
    public var onChange : (stage : Int) -> Void = {_ in}
    public var stage = 0
    

    public init(stages: [UIView] = [], onChange: ((stage: Int) -> Void)? = nil){
        super.init(frame: CGRect.zero)
        self.stages = stages.reverse()
        self.clipsToBounds = true
        if onChange != nil {
            self.onChange = onChange!
        }
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        for view in self.stages {
            self.addSubview(view)
        }
        setupPan()
    }
    
    public func setupPan(){
    // REGISTERS THE PAN
        let pan = UIPanGestureRecognizer(target: self, action: "panning:")
        if self.stages.count == 0 || self.stage >= self.stages.count {
            return
        }
//        self.stages.last!.addGestureRecognizer(pan)
        self.getVisibleView().addGestureRecognizer(pan)
    }
    
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        for view in self.stages {
            view.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        }
    }

    public func panning(pan: UIPanGestureRecognizer){
        let finger = pan.translationInView(pan.view)
        let view = pan.view
        var move = view?.frame
        move?.origin.x = finger.x
        view?.frame = move!
        
        if pan.state == .Ended {
            // CHECK IF THE SWIPE HAS BEEN MORE THAN HALF . ELSE REVERT
            if view?.frame.origin.x >= self.frame.width / 2 {
                nextView(from: view!)
            } else {
                resetView(view!)
            }
        }
    }
    
    public func resetView(view: UIView){
        UIView.animateWithDuration(0.3) { () -> Void in
            var f = view.frame
            f.origin.x = 0
            view.frame = f
        }
        self.stage  = self.getStageForView(view)
    }
    
    
    // MOVES THE VIEW COMPLETELY OUT
    // REMOVES FROM THE SUPER VIEW
    // REMOVES FROM THE SELF.stages
    // CALLS ONCHAGE
    // INCREMENTS "STAGE"
    public func nextView(from from: UIView){
        let view = from
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            var f = view.frame
            f.origin.x = self.frame.width
            view.frame = f
        }) { (done) -> Void in
            self.stage += 1
            self.setupPan() // SETUPS UP THE PAN FOR THE NEXT VIEW
            self.onChange(stage: self.stage)
        }
    }
    
    public func getVisibleView() -> UIView {
        return self.stages[self.stages.count - stage - 1]
    }
    
    public func getViewForStage(stage: Int) -> UIView {
        return self.stages[self.stages.count - stage - 1]
    }
    
    public func getStageForView(view: UIView) -> Int {
        return self.stages.count - self.stages.indexOf(view)! - 1
    }
    
    public func back(){
        if stage < 1 {
            return
        }
        self.resetView(self.getViewForStage(self.stage - 1))
    }
    
}
