//
//  PineSelectTextFieldInputView.swift
//  Pods
//
//  Created by Prakash Raman on 11/03/16.
//
//

import UIKit

open class PineSelectTextFieldInputView: UIControl {
    
    open var done : PineButton = PineButton(title: "DONE")
    open var select : PineSelectGroup = PineSelectGroup()
    open var items : [AnyObject] = []
    open var textField : UITextField? = nil
    
    public init(items: [AnyObject] = []){
        super.init(frame: CGRect.zero)
        self.frame = CGRect(x: 0, y: 0, width: 0, height: 250)
        self.items = items
        setup()
    }
    
    convenience public init(textField: UITextField, items: [AnyObject] = []) {
        self.init(items: items)
        self.textField = textField
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup(){
        self.select = preferredSelectGroup()
        self.addSubview(done)
        self.addSubview(select)
        style()
    }
    
    open func style(){
        styleSelect()
        styleDone()
    }
    
    open func styleSelect(){
        self.select.snp_makeConstraints { (make) -> Void in
            make.left.top.right.equalTo(self)
            make.bottom.equalTo(self.done.snp_top)
        }
    }
    
    open func styleDone(){
        self.done.snp_makeConstraints { (make) -> Void in
            make.left.right.bottom.equalTo(self)
            make.height.equalTo(PineConfig.Button.height)
        }
    }
    
    open func preferredSelectGroup() -> PineSelectGroup {
        return PineSelectGroup(items: items)
    }
    
}
