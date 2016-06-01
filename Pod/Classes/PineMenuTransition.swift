//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


public class PineMenuTransition : NSObject {
    
    public var mainController: PineMenuViewController?
    public var menuView: PineBaseMenuView?
    
    public override init(){
        self.mainController = nil        
    }
    
    // ONCE THE CONTROLLER IS SETUP THE MENU IS SETUP AS WELL
    // START MENU POSITION IS VERY IMPORTANT
    func setController(controller: PineMenuViewController){
        self.mainController = controller
        self.menuView = self.mainController!.menuView!
        self.setup()
    }
    
    func setup(){
        self.mainController!.menuView!.frame = self.mainController!.view.frame
    }
    
    func toggle(){
	setup()
        if self.isOpen() {
            close()
        } else {
            open()
        }
    }
    
    func isOpen() -> Bool {
        let contentFrame = self.mainController!.contentNavigationController!.view.frame
        let controllerFrame = self.mainController!.view.frame
        return (controllerFrame != contentFrame) ? true : false
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
