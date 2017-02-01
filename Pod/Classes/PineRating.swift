//
//  PineRating.swift
//  Pods
//
//  Created by Prakash Raman on 06/04/16.
//
//

import UIKit

open class PineRating: UIControl {
    
    open var items : [UIImageView] = []
    open var rating : CGFloat = 0
    open var outof : CGFloat = 5
    
    public init(rating: CGFloat, outof: CGFloat = 5){
        super.init(frame: CGRect.zero)
        self.rating = rating
        self.outof = outof
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(){
        for i in 0...Int(self.outof) - 1 {
            let iv = UIImageView(image: getPreferredImageForIndex(i))
            items.append(iv)
            self.addSubview(iv)
            iv.contentMode = .center
            iv.clipsToBounds = true
        }
    }
    
    open func getPreferredDullImage() -> UIImage {
        return UIImage(named: "star_dull")!
    }
    
    open func getPreferredImage() -> UIImage {
        return UIImage(named: "star")!
    }
    
    open func getPreferredImageForIndex(_ index: Int = 0) -> UIImage {
        return index < Int(self.rating) ? getPreferredImage() : getPreferredDullImage()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        positionItems()
    }
    
    open func positionItems(){
        var x : CGFloat = 0
        let height = self.frame.height
        let width = self.frame.width / CGFloat(items.count)
        
        for iv in items {
            iv.frame = CGRect(x: x, y: 0, width: width, height: height)
            x += width
        }
        
    }

}
