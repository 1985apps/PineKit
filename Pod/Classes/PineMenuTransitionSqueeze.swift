//
//  PineMenuTransitionSqueeze.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


public class PineMenuTransitionSqueeze : PineMenuTransition {
    
    public var squeezeBy : CGFloat = PineConfig.Menu.Transition.Squeeze.by
    public var moveX = PineConfig.Menu.Transition.Squeeze.x
    
    public override init(){
        super.init()
    }
    
    
    override func open(){
        let navigationView = self.mainController?.contentNavigationController!.view
        let contentController = self.mainController?.contentNavigationController?.viewControllers.last
        
        UIView.animateWithDuration(PineConfig.Menu.transitionDuration, animations: {
            navigationView!.frame = self.getOpenFrame()
            contentController?.view.layer.cornerRadius = 4
        }) { (finished) in
            UIView.animateWithDuration(0.2, animations: {
                self.mainController?.contentNavigationController?.navigationBar.frame.size.height += 20
            })
        }
        
        let layer = navigationView?.layer
        layer!.shadowColor = UIColor.blackColor().CGColor
        layer!.shadowOpacity = 0.2
        layer!.shadowOffset = CGSizeZero
        layer!.shadowRadius = 4
    }
    
    func getOpenFrame() -> CGRect {
        var frame = self.mainController?.contentNavigationController?.view.frame
        self.mainController?.contentNavigationController?.navigationBar.frame.size.height += 20
        let height : CGFloat = (frame?.size.height)! - self.squeezeBy
        frame?.size.height = height - self.squeezeBy
        frame?.origin.x = self.moveX
        frame?.origin.y = self.squeezeBy
        return frame!
    }
    
    override func close(){
        super.close()
        let contentController = self.mainController?.contentNavigationController?.viewControllers.last
        contentController?.view.layer.cornerRadius = 0
    }
    
    
}
