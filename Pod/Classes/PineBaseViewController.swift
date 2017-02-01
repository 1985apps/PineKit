//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


/**
 This helper View Controller class. See that all your ViewController's inherit from this class. It contains a bunch of helper functions
*/
open class PineBaseViewController : UIViewController {

    /**
        Setups the button states of the view controller. If you override this method see that you are calling it's super method 
     
     
            super.viewDidLoad()
    */
    override open func viewDidLoad() {
        super.viewDidLoad()
        determineNavBarButtons()
        determineBackButton()
    }

    /**
        Sets the Navigation Bar's Text Color. You might want to call this method from both *viewDidLoad* and *viewDidAppear*
     
        - parameter color: UIColor
    */
    open func setNavigationTitleColor(_ color: UIColor){
        let attrs : NSDictionary = [NSForegroundColorAttributeName : color]
        self.navigationController?.navigationBar.titleTextAttributes = attrs as? [String : AnyObject]
    }

    ///
    override open func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    /**
        Just a helper to the parent's pushViewController. Will probably delete it soon
    
        - parameter viewController: UIViewController
    */
    open func pushViewController(_ viewController: UIViewController){
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
    open func goback(_ sender: AnyObject? = nil){
        self.navigationController?.popViewController(animated: true)
    }

    /// Opens the menu view
    /// This would work only if this is part of a PineMenuViewController
    open func openmenu(_ sender: AnyObject? = nil){
        if let parent = self.parent {
            if let parent = parent.parent {
                (parent as! PineMenuViewController).toggleMenu()
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

    /**
     Should return an instance of UIImage to be set as the left bar button item
     *note: Only return a UIImage and not a a UIBarButtonItem*
     
     - Returns: UIImage
    */
    open func preferredBackButton() -> UIImage {
        let count = self.navigationController?.viewControllers.count
        let name = count <= 1 ? "menu" : "back"
        return (UIImage(named: name)?.withRenderingMode(.alwaysOriginal))!
    }

    /**
     Override this method in order to completely have control over the left bar button item. 
     
     Currently if there is only 1 item in the stack "openmenu:" is called, else "goback:"
     
     - Returns: UIBarButtonItem
    */
    open func preferredLeftBarButtonItem() -> UIBarButtonItem {
        let count = self.navigationController?.viewControllers.count
        let action =  count > 1 ? "goback:" : "openmenu:"
        return UIBarButtonItem(image: preferredBackButton(), landscapeImagePhone: .none, style: .plain, target: self, action: Selector(action))
    }

    /**
        Should return the image for the right bar button

        - Returns: UIImage 
    */
    open func preferredRightButton() -> UIImage {
        return UIImage()
    }

    /**
        Override this method for complete control over the right bar item. e.g. When right bar would need to have a UIView instead of a UIImage
    
        - Returns: UIBarButtonItem
    */
    open func preferredRightButtonItem() -> UIBarButtonItem {
        let image = preferredRightButton()
        return UIBarButtonItem(image: image, landscapeImagePhone: .none, style: .plain, target: self, action: #selector(PineBaseViewController.preferredRightButtonTarget(_:)))
    }

    /**
        This method is called when the right bar button is clicked. Override and include your own callback
    */
    open func preferredRightButtonTarget(_ sender: AnyObject){

    }
    
    /**
        Override this method if a view other than just a title is needed to be displayed in the place of the navigation bar's title.
     
        - Returns: UIView
    */
    open func preferredTitleView() -> UIView? {
        return nil
    }

}
