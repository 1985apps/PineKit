//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


open class PineMenuViewController : UIViewController, PineMenuDelegate  {
    
    open var menuView: PineBaseMenuView?
    open var contentNavigationController: UINavigationController?
    open var transition = PineMenuTransition()
    open var rootViewController = PineBaseViewController()
    open let blockView = UIView()
    
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
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setup()
    }
    
    override open func didReceiveMemoryWarning() {
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
        self.contentNavigationController!.didMove(toParentViewController: self)
        
        // SET THE FRAME TO THE PARENT FRAME
        // THIS DOES NOT USE AUTOLAYOUT - AS THERE WILL BE ANIMATIONS ON THE FRAME
        self.contentNavigationController!.view.frame = self.view.frame
        
        
        // SETUP THE BACKGROUND COLOR OF NAVBAR
        //self.contentNavigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        //self.contentNavigationController?.navigationBar.shadowImage = UIImage()
        //self.contentNavigationController?.navigationBar.translucent = true
        self.contentNavigationController?.navigationBar.tintColor = UIColor.clear
        self.setupSwipeLeft()
    }
    
    func toggleMenu(_ sender: AnyObject? = nil){
        self.transition.toggle()
        if transition.isOpen() {
            let vcView = self.contentNavigationController?.viewControllers.last!.view
            blockView.frame = vcView!.frame
            
            // TAP
            let t = UITapGestureRecognizer(target: self, action: #selector(self.toggleMenu(_:)))
            blockView.addGestureRecognizer(t)
            
            // SWIPE RIGHT
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.toggleMenu(_:)))
            swipeLeft.direction = UISwipeGestureRecognizerDirection.left
            blockView.addGestureRecognizer(swipeLeft)
            
            vcView!.addSubview(blockView)
        } else {
            blockView.removeFromSuperview()
        }
    }
    
    func setupSwipeLeft() {
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(self.swipeLeft(_:)))
        edgePan.edges = .left
        // ADD TO FIRST VC VIEW
        self.contentNavigationController?.viewControllers.first?.view.addGestureRecognizer(edgePan)
    }
    
    func swipeLeft(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        if recognizer.state == .recognized {
            self.toggleMenu()
        }
    }
    
    
    /* DELEGATE METHODS public */
    open func loadContentViewController(_ viewController: PineBaseViewController) {
        self.contentNavigationController?.setViewControllers([viewController], animated: true)
        self.setupSwipeLeft()
        self.transition.close()
    }
    
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        if let style = self.contentNavigationController?.viewControllers.last?.preferredStatusBarStyle {
            return style
        }
        return .default
    }
    
}
