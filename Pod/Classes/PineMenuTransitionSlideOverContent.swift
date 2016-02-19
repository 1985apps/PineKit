//
//  PineMenuTransitionSlideOverContent.swift
//  Pods
//
//  Created by Prakash Raman on 19/02/16.
//
//

import UIKit
import Foundation

public class PineMenuTransitionSlideOverContent: PineMenuTransition {
    
    let overlay = UIView()
    
    override func setup(){
        self.menuView?.frame = self.getStartingFrame()
        self.menuView?.layer.zPosition = 1000 // BRING TO THE TOPMOST LEVEL
    }
    
    func getStartingFrame() -> CGRect {
        let parent = self.mainController!.view
        var frame = parent.frame
        frame.size.width = frame.size.width * (2/3)
        frame.origin.x = -(frame.width)
        return frame
    }
    
    override func open(){
        var frame = self.menuView?.frame
        frame!.origin.x = 0
        UIView.animateWithDuration(PineConfig.Menu.transitionDuration) { () -> Void in
            self.menuView?.frame = frame!
        }
        
        self.displayOverlay()
    }
    
    override func close(){
        UIView.animateWithDuration(PineConfig.Menu.transitionDuration) { () -> Void in
            self.menuView?.frame = self.getStartingFrame()
        }
        
        self.overlay.removeFromSuperview()
    }
    
    override func isOpen() -> Bool {
        return (self.menuView?.frame.origin.x < 0) ? false : true
    }
    
    func displayOverlay(){
        self.mainController!.view.addSubview(overlay)
        overlay.backgroundColor = UIColor.blackColor()
        overlay.frame = self.mainController!.view.frame
        overlay.alpha = 0.3
        
        overlay.userInteractionEnabled = true
        overlay.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "overlayClick:"))
    }
    
    func overlayClick(sender: UITapGestureRecognizer? = nil){
        self.close()
    }
    
}
