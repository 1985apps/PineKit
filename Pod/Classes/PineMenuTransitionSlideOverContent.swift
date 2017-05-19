//
//  PineMenuTransitionSlideOverContent.swift
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


open class PineMenuTransitionSlideOverContent: PineMenuTransition {
    
    let overlay = UIView()
    
    override func setup(){
        self.menuView?.frame = self.getStartingFrame()
        self.menuView?.layer.zPosition = 1000 // BRING TO THE TOPMOST LEVEL
    }
    
    func getStartingFrame() -> CGRect {
        let parent = self.mainController!.view
        var frame = parent?.frame
        frame?.size.width = (frame?.size.width)! * (2/3)
        frame?.origin.x = -((frame?.width)!)
        return frame!
    }
    
    override func open(){
        var frame = self.menuView?.frame
        frame!.origin.x = 0
        UIView.animate(withDuration: PineConfig.Menu.transitionDuration, animations: { () -> Void in
            self.menuView?.frame = frame!
        }) 
        
        self.displayOverlay()
    }
    
    override func close(){
        UIView.animate(withDuration: PineConfig.Menu.transitionDuration, animations: { () -> Void in
            self.menuView?.frame = self.getStartingFrame()
        }) 
        
        self.overlay.removeFromSuperview()
    }
    
    override func isOpen() -> Bool {
        return (self.menuView?.frame.origin.x < 0) ? false : true
    }
    
    func displayOverlay(){
        self.mainController!.view.addSubview(overlay)
        overlay.backgroundColor = UIColor.black
        overlay.frame = self.mainController!.view.frame
        overlay.alpha = 0.3
        
        overlay.isUserInteractionEnabled = true
        overlay.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(PineMenuTransitionSlideOverContent.overlayClick(_:))))
    }
    
    func overlayClick(_ sender: UITapGestureRecognizer? = nil){
        self.close()
    }
    
}
