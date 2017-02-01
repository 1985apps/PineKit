//
//  Button.swift
//  Petter
//
//  Created by Prakash Raman on 08/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import UIKit
import SnapKit

open class PineSelectGroup: UIView {

    open var items: [UIView] = []
    var callOnSelection : (PineSelectGroup) -> Void = {_ in }
    open var separator : Bool = true
    open var itemHeight = 40
    open var singleSelect = false

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public init(){
        super.init(frame: CGRect.zero)
        self.setup()
    }

    public convenience init(items: [AnyObject]){
        self.init()
        self.pushItems(items)
        self.positionItems()
        self.after()
    }

    public convenience init(items: [AnyObject], onselection: @escaping (PineSelectGroup) -> Void){
        self.init(items: items)
        self.callOnSelection = onselection
    }

    open func setup(){
        
    }

    open func createItem(_ data: Dictionary<String, AnyObject>, group: PineSelectGroup) -> UIView {
        let item = PineSelectGroupItem(data: data, group: self)
        return item
    }

    func pushItems(_ items: [AnyObject]){
        for (_, item) in items.enumerated() {
            let entry = item as! Dictionary<String, AnyObject>
            let i = createItem(entry, group: self) as! PineSelectGroupItem
            addItem(i)
        }
    }

    func addItem(_ item: PineSelectGroupItem){
        self.addSubview(item)
        items.append(item)
    }

    open func getSelectedItems() -> [PineSelectGroupItem] {
        var selected : [PineSelectGroupItem] = []
        for item in self.items {
            if let obj = item as? PineSelectGroupItem {
                if obj.isActive() {
                    selected.append(obj)
                }
            }
        }
        return selected
    }

    open func getSelectedValues() -> [AnyObject] {
        return self.getSelectedItems().map { (item) -> AnyObject in
            return item.value
        }
    }

    open func getSelectedValue() -> AnyObject {
        return self.getSelectedValues().first!
    }

    open func onSelection(){
        self.callOnSelection(self)
    }
    
    open func unselectAll(){
        for item in self.items {
            (item as! PineSelectGroupItem).set(state: .inactive).update()
        }
    }
    
    open func selectItemAt(_ index: Int){
        (self.items[index] as! PineSelectGroupItem).set(state: .active).update()
    }

    open func positionItems(){

        if self.items.count <= 1 {
            return
        }

        for index in 0...(self.items.count - 1) {
            let item = self.items[index]
            
            let top = index == 0 ? self.snp_top : self.items[index - 1].snp_bottom
            
            item.snp_updateConstraints({ (make) -> Void in
                make.left.width.equalTo(self)
                make.height.equalTo(self.itemHeight)
                make.top.equalTo(top).offset(1)
            })
        }
    }

    // OVERIDE THIS FUNCTION TO DO THINGS AFTER THE GROUP HAS BEEN DRAWN
    open func after(){

    }


}
