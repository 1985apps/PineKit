//
//  PineSegmentedControll.swift
//  Pods
//
//  Created by Prakash Raman on 10/03/16.
//
//

import UIKit

public class PineSegmentedControl: UIControl {
    
    public var labels : [PineLabel] = []
    var onchange : PineSegmentedControl -> Void = {_ in}
    
    public var active : Int = 0 {
        didSet {
            positionThumbview()
        }
    }
    
    public var thumbview : UIView = UIView() {
        didSet {
            setupThumbview()
        }
        
        willSet {
            if thumbview.isDescendantOfView(self) {
                thumbview.removeFromSuperview()
            }
        }
    }
    
    public init(labels: [String], thumbview: UIView = UIView(), change: (PineSegmentedControl -> Void) = {_ in }){
        super.init(frame: CGRect.zero)
        for l in labels {
            self.labels.append(PineLabel(text: l))
        }
        setup()
        self.onchange = change
        self.thumbview = thumbview
        self.setupThumbview()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        self.subviews.forEach { $0.removeFromSuperview() }
        for label in self.labels {
            self.addSubview(label)
            label.textAlignment = .Center
            label.userInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "ontap:"))
            label.layer.zPosition = 2
        }
        self.clipsToBounds = true
    }
    
    public func setupThumbview(){
        self.addSubview(self.thumbview)
    }
    
    public func positionThumbview() {

        self.thumbview.layer.zPosition = 1
        UIView.animateWithDuration(0.2) { () -> Void in
            self.thumbview.center = self.labels[self.active].center
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.frame.width / CGFloat(self.labels.count)
        for index  in 0...self.labels.count - 1 {
            let x = CGFloat(index) * width
            let label = self.labels[index]
            label.frame = CGRect(origin: CGPoint(x: x, y: 0), size: CGSize(width: width, height: self.frame.height))
        }
        positionThumbview()
    }
    
    public func ontap(sender: UITapGestureRecognizer){
        let label = sender.view as! PineLabel
        self.active = self.labels.indexOf(label)!
        self.update()
    }

    public func update(){
        self.onchange(self)
    }
    
}
