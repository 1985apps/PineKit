//
//  PineImagePicker.swift
//  Pods
//
//  Created by Prakash Raman on 02/03/16.
//
//

import UIKit
import Foundation

public class PineImagePicker: UIImageView, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
    public let controller : UIViewController?
    public var sourceType: UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.Camera
    public var cameraController: UIImagePickerController = UIImagePickerController()
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(controller: UIViewController){
        self.controller = controller
        super.init(frame: CGRect.zero)
        setup()
    }
    
    public func setup(){
        style()
        self.userInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "showOpenOptions:"))
        self.cameraController.delegate = self
    }
    
    
    // STYLING HAPPENS HERE
    public func style(){
        self.backgroundColor = PineConfig.Color.grayLight
    }
    
    public func showOpenOptions(sender: AnyObject? = nil){
        let alert = UIAlertController(title: "Choose a photo", message: "Choose from either your gallery of take a photo now", preferredStyle: .ActionSheet)
        
        let gallery = UIAlertAction(title: "Gallery", style: .Default) { (action) -> Void in
            self.open(.PhotoLibrary)
        }
        
        let camera = UIAlertAction(title: "Take a photo", style: .Default) { (action) -> Void in
            self.open(.Camera)
        }
        
        alert.addAction(gallery)
        alert.addAction(camera)
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        self.controller?.presentViewController(alert, animated: true, completion: nil)
    }
    
    public func open(sourceType: UIImagePickerControllerSourceType){
        self.cameraController.sourceType = sourceType
        self.controller?.presentViewController(self.cameraController, animated: true, completion: nil)
    }
    
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        self.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.contentMode = UIViewContentMode.ScaleAspectFill
        self.clipsToBounds = true
    }

}