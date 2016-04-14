//
//  PineFluidLayout.swift
//  Pods
//
//  Created by Prakash Raman on 05/04/16.
//
//

import UIKit

public class PineFluidGridLayout: UIView {
    
    public var items : [UIView] = []
    public var containers : [UIView] = []
    public var maxColumns: Int = 3
    public var rows : Int = 0
    
    public init(views: [UIView], maxColumns: Int = 3){
        super.init(frame: CGRectZero)
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
    
    public override func layoutSubviews() {
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
                y++
            } else {
                index++
            }
            
            item.snp_makeConstraints(closure: { (make) in
                make.center.equalTo(box)
            })
            
        }
        
    }

}
