//
//  PineSwipeView.swift
//  Pods
//
//  Created by Prakash Raman on 24/02/16.
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

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func >= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l >= r
  default:
    return !(lhs < rhs)
  }
}


open class PineSwipeView: UIView {
    
    open var stages : [UIView] = []
    open var onChange : (_ stage : Int) -> Void = {_ in}
    open var stage = 0
    

    public init(stages: [UIView] = [], onChange: ((_ stage: Int) -> Void)? = nil){
        super.init(frame: CGRect.zero)
        self.stages = stages.reversed()
        self.clipsToBounds = true
        if onChange != nil {
            self.onChange = onChange!
        }
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(){
        for view in self.stages {
            self.addSubview(view)
        }
        setupPan()
    }
    
    open func setupPan(){
    // REGISTERS THE PAN
        let pan = UIPanGestureRecognizer(target: self, action: #selector(PineSwipeView.panning(_:)))
        if self.stages.count == 0 || self.stage >= self.stages.count {
            return
        }
//        self.stages.last!.addGestureRecognizer(pan)
        self.getVisibleView().addGestureRecognizer(pan)
    }
    
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        for view in self.stages {
            view.frame = CGRect(origin: CGPoint.zero, size: self.frame.size)
        }
    }

    open func panning(_ pan: UIPanGestureRecognizer){
        let finger = pan.translation(in: pan.view)
        let view = pan.view
        var move = view?.frame
        move?.origin.x = finger.x
        view?.frame = move!
        
        if pan.state == .ended {
            // CHECK IF THE SWIPE HAS BEEN MORE THAN HALF . ELSE REVERT
            if view?.frame.origin.x >= self.frame.width / 2 {
                nextView(from: view!)
            } else {
                resetView(view!)
            }
        }
    }
    
    open func resetView(_ view: UIView){
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            var f = view.frame
            f.origin.x = 0
            view.frame = f
        }) 
        self.stage  = self.getStageForView(view)
    }
    
    
    // MOVES THE VIEW COMPLETELY OUT
    // REMOVES FROM THE SUPER VIEW
    // REMOVES FROM THE SELF.stages
    // CALLS ONCHAGE
    // INCREMENTS "STAGE"
    open func nextView(from: UIView){
        let view = from
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            var f = view.frame
            f.origin.x = self.frame.width
            view.frame = f
        }, completion: { (done) -> Void in
            self.stage += 1
            self.setupPan() // SETUPS UP THE PAN FOR THE NEXT VIEW
            self.onChange(self.stage)
        }) 
    }
    
    open func getVisibleView() -> UIView {
        return self.stages[self.stages.count - stage - 1]
    }
    
    open func getViewForStage(_ stage: Int) -> UIView {
        return self.stages[self.stages.count - stage - 1]
    }
    
    open func getStageForView(_ view: UIView) -> Int {
        return self.stages.count - self.stages.index(of: view)! - 1
    }
    
    open func back(){
        if stage < 1 {
            return
        }
        self.resetView(self.getViewForStage(self.stage - 1))
    }
    
}
