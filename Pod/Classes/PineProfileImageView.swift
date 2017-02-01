//
//  PineProfileImageView.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 25/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import PineKit

open class PineProfileImageView: UIImageView {
    
    public init(image: UIImage?, border: CGFloat = 3) {
        super.init(image: image)
        self.layer.borderWidth = border
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        makeCircular()
    }
    
    open func makeCircular(){
        self.layer.cornerRadius = self.frame.height / 2
    }

}
