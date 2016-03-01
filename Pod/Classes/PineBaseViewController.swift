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
        determineNavBarButtons()
        determineBackButton()
    }

    public func setNavigationTitleColor(color: UIColor){
        let attrs : NSDictionary = [NSForegroundColorAttributeName : color]
        self.navigationController?.navigationBar.titleTextAttributes = attrs as? [String : AnyObject]
    }

    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    public func pushViewController(viewController: UIViewController){
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func determineNavBarButtons(){
        determineBackButton()
        determineRightButton()
    }

    func determineBackButton(){
        self.navigationItem.leftBarButtonItem = preferredLeftBarButtonItem()
    }

    func determineRightButton(){
        self.navigationItem.rightBarButtonItem = preferredRightButtonItem()
    }

    public func goback(sender: AnyObject? = nil){
        self.navigationController?.popViewControllerAnimated(true)
    }


    public func openmenu(sender: AnyObject? = nil){
        let parent = self.parentViewController?.parentViewController as! PineMenuViewController
        parent.toggleMenu()
    }

    /* BUTTONS */
    public func preferredBackButton() -> UIImage {
        let count = self.navigationController?.viewControllers.count
        let name = count <= 1 ? "menu" : "back"
        return (UIImage(named: name)?.imageWithRenderingMode(.AlwaysOriginal))!
    }

    public func preferredLeftBarButtonItem() -> UIBarButtonItem {
        let count = self.navigationController?.viewControllers.count
        let action =  count > 1 ? "goback:" : "openmenu:"
        return UIBarButtonItem(image: preferredBackButton(), landscapeImagePhone: .None, style: .Plain, target: self, action: Selector(action))
    }

    public func preferredRightButton() -> UIImage {
        return UIImage()
    }

    public func preferredRightButtonItem() -> UIBarButtonItem {
        let image = preferredRightButton()
        return UIBarButtonItem(image: image, landscapeImagePhone: .None, style: .Plain, target: self, action: Selector("preferredRightButtonTarget:"))
    }

    public func preferredRightButtonTarget(sender: AnyObject){

    }

}
