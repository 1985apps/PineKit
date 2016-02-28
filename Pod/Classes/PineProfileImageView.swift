//
//  PineProfileImageView.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 25/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import PineKit

public class PineProfileImageView: UIImageView {
    
    public init(image: UIImage?, border: CGFloat = 3) {
        super.init(image: image)
        self.layer.borderWidth = border
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.clipsToBounds = true
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        makeCircular()
    }
    
    public func makeCircular(){
        self.layer.cornerRadius = self.frame.height / 2
    }

}
