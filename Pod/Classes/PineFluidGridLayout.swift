//
//  PineFluidLayout.swift
//  Pods
//
//  Created by Prakash Raman on 05/04/16.
//
//

import UIKit

open class PineFluidGridLayout: UIView {
    
    open var items : [UIView] = []
    open var containers : [UIView] = []
    open var maxColumns: Int = 3
    open var rows : Int = 0
    
    public init(views: [UIView], maxColumns: Int = 3){
        super.init(frame: CGRect.zero)
        self.maxColumns = maxColumns
        self.items = views
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        if items.count == 0 {
            return
        }
        self.rows = Int(ceil((CGFloat(items.count) / CGFloat(maxColumns))))
        for item in items {
            let box = UIView()
            self.containers.append(box)
            self.addSubview(box)
            
            box.addSubview(item)
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        positionBoxes()
    }
    
    // THIS METHOD ONLY FIXES THE FRAMES OF THE BOXES
    func positionBoxes(){
        let boxWidth = self.frame.width / CGFloat(items.count > maxColumns ? maxColumns : items.count)
        let boxHeight = self.frame.height / CGFloat(rows)
        
        var x = CGFloat(0.0);
        var y = CGFloat(0.0);
        var index = 0
        
        for itemIndex in 0...containers.count - 1  {
            let box = containers[itemIndex]
            let item = items[itemIndex]
            
            let frame = CGRect(x: x, y: boxHeight * y, width: boxWidth, height: boxHeight)
            box.frame = frame

            x += boxWidth

            if (index >= maxColumns - 1) {
                index = 0
                x = 0
                y += 1
            } else {
                index += 1
            }
            
            item.snp_makeConstraints({ (make) in
                make.center.equalTo(box)
            })
            
        }
        
    }

}
