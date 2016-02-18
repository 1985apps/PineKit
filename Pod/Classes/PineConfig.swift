//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


class PineConfig {
    
    // COLORS
    
    struct Color {
        static var blue = UIColor(red:0.153, green:0.290, blue:0.380, alpha:1.00)
        static var red = UIColor(red:0.851, green:0.345, blue:0.341, alpha:1.00)
        static var cream = UIColor(red:0.765, green:0.796, blue:0.820, alpha:1.00)
        static var purple = UIColor(red:0.196, green:0.188, blue:0.369, alpha:1.00)
        
        // NAMED COLORS
        static var primary = blue
    }
    
    struct Font {
        
        enum Family : String {
            case Regular = "Lato-Regular"
            case Bold = "Lato-Bold"
            case Light = "Lato-Light"
        }
        
        static func get(type: Family = .Regular, size: CGFloat = 17.0) -> UIFont {
            return UIFont(name: type.rawValue, size: size)!
        }
    }
    
    struct Button {
        static var height = 56
        
        struct Hollow {
            static var height = 44
            static var borderColor = Color.cream
        }
    }
    
    struct Menu {
        static var transitionDuration = 0.5
    }
    
}