//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


public class PineBaseViewController : UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        determineBackButton()
    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    public func pushViewController(viewController: UIViewController){
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func determineBackButton(){
        let count = self.navigationController?.viewControllers.count
        var action = "openmenu:"
        
        if count > 1 {
            action = "goback:"
        }
        
        let icon = preferredBackButton()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: icon, landscapeImagePhone: .None, style: .Plain, target: self, action: Selector(action))
    }
    
    func goback(sender: AnyObject? = nil){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func openmenu(sender: AnyObject? = nil){
        let parent = self.parentViewController?.parentViewController as! PineMenuViewController
        parent.toggleMenu()
    }
    
    /* BUTTONS */
    func preferredBackButton() -> UIImage {
        let count = self.navigationController?.viewControllers.count
        let name = count <= 1 ? "menu" : "back"
        return (UIImage(named: name)?.imageWithRenderingMode(.AlwaysOriginal))!
    }
    
}
