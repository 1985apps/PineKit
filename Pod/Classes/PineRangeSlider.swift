//
//  PineRangeSlider.swift
//  Pods
//
//  Created by Prakash Raman on 03/03/16.
//
//

import UIKit
import Foundation

// A two-ball slider which returns both the upper and lower limit of the slider
public class PineRangeSlider: UIControl {
    
    var minBall: UIImageView?
    var maxBall: UIImageView?
    
    var ballTintColor = PineConfig.Color.red

    public init(){
        super.init(frame: CGRect.zero)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        self.minBall = UIImageView(image: getThumbImage())
        self.maxBall = UIImageView(image: getThumbImage())
        self.minBall!.tintColor = self.ballTintColor
        self.maxBall!.tintColor = self.ballTintColor
        
        let bar = getBarView()
        self.addSubviews([bar, getBarActiveView(), self.minBall!, self.maxBall!])
    
        bar.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.minBall!)
            make.left.equalTo(self.minBall!.snp_centerX)
            make.width.equalTo(200)
            make.height.equalTo(2)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.minBall!.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        self.maxBall!.frame = CGRect(x: self.frame.width, y: 0, width: 32, height: 32)
    }
    
    public func getBarView() -> UIView {
        let view = UIView()
        view.backgroundColor = PineConfig.Color.grayLight
        return view
    }
    
    public func getBarActiveView() -> UIView {
        let view = self.getBarView()
        view.backgroundColor = PineConfig.Color.blue
        return view
    }
    
    public func getThumbImage() -> UIImage {
        return UIImage(named: "filled-circle+black")!.imageWithRenderingMode(.AlwaysTemplate)
    }
    
}
