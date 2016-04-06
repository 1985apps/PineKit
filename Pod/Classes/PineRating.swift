//
//  PineRating.swift
//  Pods
//
//  Created by Prakash Raman on 06/04/16.
//
//

import UIKit

public class PineRating: UIControl {
    
    public var items : [UIImageView] = []
    public var rating : CGFloat = 0
    public var outof : CGFloat = 5
    
    public init(rating: CGFloat, outof: CGFloat = 5){
        super.init(frame: CGRectZero)
        self.rating = rating
        self.outof = outof
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        for i in 0...Int(self.outof) {
            let iv = UIImageView(image: getPreferredImageForIndex(i))
            items.append(iv)
            self.addSubview(iv)
            iv.contentMode = .Center
            iv.clipsToBounds = true
        }
    }
    
    public func getPreferredDullImage() -> UIImage {
        return UIImage(named: "star_dull")!
    }
    
    public func getPreferredImage() -> UIImage {
        return UIImage(named: "star")!
    }
    
    public func getPreferredImageForIndex(index: Int = 0) -> UIImage {
        return index <= Int(self.rating) ? getPreferredImage() : getPreferredDullImage()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        positionItems()
    }
    
    public func positionItems(){
        var x : CGFloat = 0
        var height = self.frame.height
        var width = self.frame.width / CGFloat(items.count)
        
        for iv in items {
            iv.frame = CGRect(x: x, y: 0, width: width, height: height)
            x += width
        }
        
    }

}
