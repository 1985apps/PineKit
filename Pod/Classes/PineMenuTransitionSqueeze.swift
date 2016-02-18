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
    
    override func open(){
        UIView.animateWithDuration(PineConfig.Menu.transitionDuration) { () -> Void in
            self.mainController?.contentNavigationController!.view.frame = self.getOpenFrame()
        }
    }
    
    func getOpenFrame() -> CGRect {
        let diff : CGFloat = 100.0
        var frame = self.mainController?.contentNavigationController?.view.frame
        let height : CGFloat = (frame?.size.height)! - diff
        frame?.size.height = height - diff
        frame?.origin.x = (frame?.size.width)! - diff
        frame?.origin.y = diff
        return frame!
    }
    
    
}
