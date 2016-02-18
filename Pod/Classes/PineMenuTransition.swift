//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


class PineMenuTransition {
    
    var mainController: PineMenuViewController?
    
    func setController(controller: PineMenuViewController){
//        self.mainController = controller
    }
    
    func toggle(){
        let contentFrame = self.mainController!.contentNavigationController!.view.frame
        let controllerFrame = self.mainController!.view.frame
        if controllerFrame != contentFrame {
            close()
        } else {
            open()
        }
    }
    
    func open(){
        UIView.animateWithDuration(PineConfig.Menu.transitionDuration) { () -> Void in
            var frame = (self.mainController?.contentNavigationController!.view.frame)! as CGRect
            frame.origin.x = 200
            self.mainController?.contentNavigationController!.view.frame = frame
        }
    }
    
    func close(){
        UIView.animateWithDuration(PineConfig.Menu.transitionDuration) { () -> Void in
            self.mainController!.contentNavigationController!.view.frame = self.mainController!.view.frame
        }
    }
    
}
