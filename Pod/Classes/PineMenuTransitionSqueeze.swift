//
//  KamaConfig.swift
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
        UIView.animateWithDuration(PineConfig.Menu.transitionDuration) { () -> Void in
            self.mainController?.contentNavigationController!.view.frame = self.getOpenFrame()
        }
    }
    
    func getOpenFrame() -> CGRect {
        var frame = self.mainController?.contentNavigationController?.view.frame
        let height : CGFloat = (frame?.size.height)! - self.squeezeBy
        frame?.size.height = height - self.squeezeBy
        frame?.origin.x = self.moveX
        frame?.origin.y = self.squeezeBy
        return frame!
    }
    
    
}
