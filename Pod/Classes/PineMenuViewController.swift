//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


public class PineMenuViewController : UIViewController, PineMenuDelegate  {
    
    var menuView: PineBaseMenuView?
    var contentNavigationController: UINavigationController?
    var transition = PineMenuTransition()
    var rootViewController = PineBaseViewController()
    
    public init(menuView: PineBaseMenuView, rootViewController: PineBaseViewController, transition: PineMenuTransition = PineMenuTransition()){
        
        super.init(nibName: nil, bundle: nil)
        
        self.menuView = menuView
        self.rootViewController = rootViewController
        self.transition = transition
        self.transition.setController(self)
        
        // SET THE DELEGATE TO THE MENU VIEW
        self.menuView!.delegate = self
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     public override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        self.view.addSubview(self.menuView!)
        setupNavigationController()
    }
    
    func setupNavigationController(){
        self.contentNavigationController = UINavigationController(rootViewController: self.rootViewController)

        self.addChildViewController(self.contentNavigationController!)
        self.view.addSubview(self.contentNavigationController!.view)
        self.contentNavigationController!.didMoveToParentViewController(self)
        
        // SET THE FRAME TO THE PARENT FRAME
        // THIS DOES NOT USE AUTOLAYOUT - AS THERE WILL BE ANIMATIONS ON THE FRAME
        self.contentNavigationController!.view.frame = self.view.frame
        
        
        // SETUP THE BACKGROUND COLOR OF NAVBAR
        self.contentNavigationController!.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.contentNavigationController!.navigationBar.shadowImage = UIImage()
        self.contentNavigationController!.navigationBar.translucent = true
        self.contentNavigationController?.navigationBar.tintColor = UIColor.redColor()
    }
    
    func toggleMenu(){
        self.transition.toggle()
    }
    
    
    /* DELEGATE METHODS public */
    public func loadContentViewController(viewController: PineBaseViewController) {
        let last = self.contentNavigationController?.viewControllers.last as! PineBaseViewController
        last.pushViewController(viewController)
        self.transition.close()
    }
    
    override public func preferredStatusBarStyle() -> UIStatusBarStyle {
        if let style = self.contentNavigationController?.viewControllers.last?.preferredStatusBarStyle() {
            return style
        }
        return .Default
    }
    
}
