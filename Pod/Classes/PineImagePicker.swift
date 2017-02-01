//
//  PineImagePicker.swift
//  Pods
//
//  Created by Prakash Raman on 02/03/16.
//
//

import UIKit
import Foundation
//import BSImagePicker
import Photos

open class PineImagePicker: UIImageView, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
//    public let controller : UIViewController?
//    public var sourceType: UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.Camera
//    public var cameraController: UIImagePickerController = UIImagePickerController()
//    
//    required public init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    public init(controller: UIViewController){
//        self.controller = controller
//        super.init(frame: CGRect.zero)
//        setup()
//    }
//    
//    public func setup(){
//        style()
//        self.userInteractionEnabled = true
//        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "showOpenOptions:"))
//        self.cameraController.delegate = self
//    }
//    
//    
//    // STYLING HAPPENS HERE
//    public func style(){
//        self.backgroundColor = PineConfig.Color.grayLight
//    }
//    
//    public func showOpenOptions(sender: AnyObject? = nil){
//        let alertController = UIAlertController(title: "Choose a photo", message: "Choose from either your gallery of take a photo now", preferredStyle: .ActionSheet)
//        
//        let gallery = UIAlertAction(title: "Gallery", style: .Default) { (action) -> Void in
////            self.open(.PhotoLibrary)
//            self.openPhotoGallery()
//        }
//        
//        let camera = UIAlertAction(title: "Take a photo", style: .Default) { (action) -> Void in
//            self.open(.Camera)
//        }
//        
//        alertController.addAction(gallery)
//        alertController.addAction(camera)
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
//        if let popoverController = alertController.popoverPresentationController {
//            popoverController.sourceView = self
//            popoverController.sourceRect = self.bounds
//        }
//        self.controller?.presentViewController(alertController, animated: true, completion: nil)
//    }
//    
//    public func open(sourceType: UIImagePickerControllerSourceType){
//        self.cameraController.sourceType = sourceType
//        self.controller?.presentViewController(self.cameraController, animated: true, completion: nil)
//    }
//    
//    // THIS OPENS A PHOTO GALLERY WITH MULTI PICK OPTION
//    public func openPhotoGallery(){
//        let vc = BSImagePickerViewController()
//        
//        self.controller?.bs_presentImagePickerController(vc, animated: true, select: nil, deselect: nil, cancel: nil, finish: { (assets) in
//            
//            var images : [UIImage] = []
//            let manager = PHImageManager.defaultManager()
//            let options = PHImageRequestOptions()
//            
//            options.synchronous = true
//            
//            for asset in assets {
//                manager.requestImageForAsset(asset, targetSize: CGSize(width: 600, height: 800), contentMode: .AspectFit, options: options, resultHandler: { (image, info) in
//                    images.append(image!)
//                })
//            }
//            
//            self.onSelection(images: images)
//        }, completion: nil)
//    }
//    
//    public func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        picker.dismissViewControllerAnimated(true, completion: nil)
//        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        self.contentMode = UIViewContentMode.ScaleAspectFill
//        self.clipsToBounds = true
//
//        onSelection(images: [image!])
//    }
//    
//    public func onSelection(images images: [UIImage]){
//        self.image = images.first!
//    }

}
