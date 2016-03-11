//
//  PineSelectTextFieldInputView.swift
//  Pods
//
//  Created by Prakash Raman on 11/03/16.
//
//

import UIKit

public class PineSelectTextFieldInputView: UIControl {
    
    public var done : PineButton = PineButton(title: "DONE")
    public var select : PineSelectGroup = PineSelectGroup()
    var items : [AnyObject] = []
    
    public init(items: [AnyObject] = []){
        super.init(frame: CGRectZero)
        self.frame = CGRect(x: 0, y: 0, width: 0, height: 250)
        self.items = items
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(){
        self.select = PineSelectGroup(items: items)
        self.addSubview(done)
        self.addSubview(select)
        style()
    }
    
    public func style(){
        styleSelect()
        styleDone()
    }
    
    public func styleSelect(){
        self.select.snp_makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(self)
            make.bottom.equalTo(self.done.snp_top)
        }
    }
    
    public func styleDone(){
        self.done.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(PineConfig.Button.height)
        }
    }
    
}
