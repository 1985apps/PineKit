//
//  PineSegmentedControll.swift
//  Pods
//
//  Created by Prakash Raman on 10/03/16.
//
//

import UIKit

open class PineSegmentedControl: UIControl {
    
    open var labels : [PineLabel] = []
    var onchange : (PineSegmentedControl) -> Void = {_ in}
    
    open var active : Int = 0 {
        didSet {
            positionThumbview()
        }
    }
    
    open var thumbview : UIView = UIView() {
        didSet {
            setupThumbview()
        }
        
        willSet {
            if thumbview.isDescendant(of: self) {
                thumbview.removeFromSuperview()
            }
        }
    }
    
    public init(labels: [String], thumbview: UIView = UIView(), change: @escaping ((PineSegmentedControl) -> Void) = {_ in }){
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
    
    open func setup(){
        self.subviews.forEach { $0.removeFromSuperview() }
        for label in self.labels {
            self.addSubview(label)
            label.textAlignment = .center
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(PineSegmentedControl.ontap(_:))))
            label.layer.zPosition = 2
        }
        self.clipsToBounds = true
    }
    
    open func setupThumbview(){
        self.addSubview(self.thumbview)
    }
    
    open func positionThumbview() {

        self.thumbview.layer.zPosition = 1
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.thumbview.center = self.labels[self.active].center
        }) 
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        let width = self.frame.width / CGFloat(self.labels.count)
        for index  in 0...self.labels.count - 1 {
            let x = CGFloat(index) * width
            let label = self.labels[index]
            label.frame = CGRect(origin: CGPoint(x: x, y: 0), size: CGSize(width: width, height: self.frame.height))
        }
        positionThumbview()
    }
    
    open func ontap(_ sender: UITapGestureRecognizer){
        let label = sender.view as! PineLabel
        self.active = self.labels.index(of: label)!
        self.update()
    }

    open func update(){
        self.onchange(self)
    }
    
}
