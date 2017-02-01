//
//  Button.swift
//  Petter
//
//  Created by Prakash Raman on 08/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import SnapKit

open class PineSelectGroupItem : UIView {

    open var data : Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()

    public enum State {
        case active, inactive
    }

    open let label = UILabel()
    open let icon = PineIcon(named: "checkbox_inactive")
    open var text: String = ""
    open var value: AnyObject = "" as AnyObject
    open var state: State = .inactive
    open var group: PineSelectGroup? = nil


    public init(data: Dictionary<String, AnyObject>, group: PineSelectGroup){
        super.init(frame: CGRect.zero)
        self.data = data
        self.text = data["text"] as? String ?? ""
        self.value = data["value"] ?? "" as AnyObject
        self.group = group

        setup()
    }


    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func setup(){
        self.addSubview(self.label)
        self.addSubview(self.icon)

        drawSelf()
        observeTouch()
        update()
    }

    open func drawSelf(){
        drawLabel()
        drawIcon()
    }

    open func drawLabel(){
        self.label.snp_makeConstraints { (make) -> Void in
            make.centerY.left.equalTo(self)
        }
    }

    open func drawIcon(){
        self.icon.snp_makeConstraints { (make) -> Void in
            make.right.centerY.equalTo(self)
            make.size.equalTo(PineConfig.Size.icon)
        }
    }

    func observeTouch(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(PineSelectGroupItem.tapped(_:)))
        self.addGestureRecognizer(gesture)
    }

    func tapped(_ sender: UITapGestureRecognizer? = nil){
        
        // DO NOTHING, IF THE SELECTED ITEM IS TAPPED ON AND IF THE GROUP HAS A SINGLESELECT == TRUE (acting as radio group)
        // IT CALLS THE CALLBACK AS WELL
        if self.group?.singleSelect == true && self.state == .active {
            self.group?.onSelection()
            return
        }
        
        let s : State = (self.state == .active) ? .inactive : .active
        if self.group?.singleSelect == true {
            self.group?.unselectAll()
        }
        set(state: s).beforeUpdate().update()
        self.group?.onSelection()
    }

    open func set(state: State) -> PineSelectGroupItem {
        self.state = state
        return self
    }

    open func isActive() -> Bool {
        return self.state == .active ? true : false
    }

    open func beforeUpdate() -> PineSelectGroupItem {
        return self
    }

    open func update(){
        self.label.text = self.text
        let iconname = self.isActive() ? "checkbox_active" : "checkbox_inactive"
        self.icon.change(named: iconname)
    }

}
