//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


open class PineMenuTransitionXY : PineMenuTransition {
    open var transitionX : CGFloat = 200
    open var transitionY : CGFloat = 200
    
    override func open(){
        UIView.animate(withDuration: PineConfig.Menu.transitionDuration, animations: { () -> Void in
            var frame = (self.mainController?.contentNavigationController!.view.frame)! as CGRect
            frame.origin.x = self.transitionX
            frame.origin.y = self.transitionY
            self.mainController?.contentNavigationController!.view.frame = frame
        })
    }
    
    
}
