//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit

/**
 This helper View Controller class. See that all your ViewController's inherit from this class. It contains a bunch of helper functions
*/
public class PineBaseViewController : UIViewController {

    /**
        Setups the button states of the view controller. If you override this method see that you are calling it's super method 
     
     
            super.viewDidLoad()
    */
    override public func viewDidLoad() {
        super.viewDidLoad()
        determineNavBarButtons()
        determineBackButton()
    }

    /**
        Sets the Navigation Bar's Text Color. You might want to call this method from both *viewDidLoad* and *viewDidAppear*
     
        - parameter color: UIColor
    */
    public func setNavigationTitleColor(color: UIColor){
        let attrs : NSDictionary = [NSForegroundColorAttributeName : color]
        self.navigationController?.navigationBar.titleTextAttributes = attrs as? [String : AnyObject]
    }

    ///
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }

    /**
        Just a helper to the parent's pushViewController. Will probably delete it soon
    
        - parameter viewController: UIViewController
    */
    public func pushViewController(viewController: UIViewController){
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func determineNavBarButtons(){
        determineBackButton()
        determineRightButton()
        determinTitleView()
    }

    func determineBackButton(){
        self.navigationItem.leftBarButtonItem = preferredLeftBarButtonItem()
    }

    func determineRightButton(){
        self.navigationItem.rightBarButtonItem = preferredRightButtonItem()
    }
    
    func determinTitleView(){
        if let view = preferredTitleView() {
            self.navigationItem.titleView = view
        }
    }

    /// Pops the top most view controller in the stack
    public func goback(sender: AnyObject? = nil){
        self.navigationController?.popViewControllerAnimated(true)
    }

    /// Opens the menu view
    /// This would work only if this is part of a PineMenuViewController
    public func openmenu(sender: AnyObject? = nil){
        let parent = self.parentViewController?.parentViewController as! PineMenuViewController
        parent.toggleMenu()
    }

    /**
     Should return an instance of UIImage to be set as the left bar button item
     *note: Only return a UIImage and not a a UIBarButtonItem*
     
     - Returns: UIImage
    */
    public func preferredBackButton() -> UIImage {
        let count = self.navigationController?.viewControllers.count
        let name = count <= 1 ? "menu" : "back"
        return (UIImage(named: name)?.imageWithRenderingMode(.AlwaysOriginal))!
    }

    /**
     Override this method in order to completely have control over the left bar button item. 
     
     Currently if there is only 1 item in the stack "openmenu:" is called, else "goback:"
     
     - Returns: UIBarButtonItem
    */
    public func preferredLeftBarButtonItem() -> UIBarButtonItem {
        let count = self.navigationController?.viewControllers.count
        let action =  count > 1 ? "goback:" : "openmenu:"
        return UIBarButtonItem(image: preferredBackButton(), landscapeImagePhone: .None, style: .Plain, target: self, action: Selector(action))
    }

    /**
        Should return the image for the right bar button

        - Returns: UIImage 
    */
    public func preferredRightButton() -> UIImage {
        return UIImage()
    }

    /**
        Override this method for complete control over the right bar item. e.g. When right bar would need to have a UIView instead of a UIImage
    
        - Returns: UIBarButtonItem
    */
    public func preferredRightButtonItem() -> UIBarButtonItem {
        let image = preferredRightButton()
        return UIBarButtonItem(image: image, landscapeImagePhone: .None, style: .Plain, target: self, action: Selector("preferredRightButtonTarget:"))
    }

    /**
        This method is called when the right bar button is clicked. Override and include your own callback
    */
    public func preferredRightButtonTarget(sender: AnyObject){

    }
    
    /**
        Override this method if a view other than just a title is needed to be displayed in the place of the navigation bar's title.
     
        - Returns: UIView
    */
    public func preferredTitleView() -> UIView? {
        return nil
    }

}