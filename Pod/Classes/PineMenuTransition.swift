//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


open class PineMenuTransition : NSObject {
    
    open var mainController: PineMenuViewController?
    open var menuView: PineBaseMenuView?
    open var x : CGFloat = 200
    
    public override init(){
        self.mainController = nil
    }
    
    // ONCE THE CONTROLLER IS SETUP THE MENU IS SETUP AS WELL
    // START MENU POSITION IS VERY IMPORTANT
    func setController(_ controller: PineMenuViewController){
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
        UIView.animate(withDuration: PineConfig.Menu.transitionDuration, animations: { () -> Void in
            var frame = (self.mainController?.contentNavigationController!.view.frame)! as CGRect
            frame.origin.x = self.x
            self.mainController?.contentNavigationController!.view.frame = frame
        })
    }
    
    func close(){
        UIView.animate(withDuration: PineConfig.Menu.transitionDuration, animations: { () -> Void in
            self.mainController!.contentNavigationController!.view.frame = self.mainController!.view.frame
        })
    }
    
}
