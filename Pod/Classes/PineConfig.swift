//
//  KamaConfig.swift
//  KamaUIKit
//
//  Created by Prakash Raman on 13/02/16.
//  Copyright © 2016 1985. All rights reserved.
//

import Foundation
import UIKit


public class PineConfig {
    
    // COLORS
    
    public struct Color {
        public static var blue = UIColor(red:0.153, green:0.290, blue:0.380, alpha:1.00)
        public static var red = UIColor(red:0.851, green:0.345, blue:0.341, alpha:1.00)
        public static var cream = UIColor(red:0.765, green:0.796, blue:0.820, alpha:1.00)
        public static var purple = UIColor(red:0.196, green:0.188, blue:0.369, alpha:1.00)
        public static var grayLight = UIColor(red:0.957, green:0.961, blue:0.969, alpha:1.00)
        
        // NAMED COLORS
        public static var primary = blue
    }
    
    public struct Font {
        
        public enum Family : String {
            case Regular = "HelveticaNeue"
            case Bold = "HelveticaNeue-Bold"
            case Light = "HelveticaNeue-Light"
        }
        
        public static func get(type: Family = .Regular, size: CGFloat = 17.0) -> UIFont {
            return UIFont(name: type.rawValue, size: size)!
        }
    }
    
    public struct Button {
        
        public static var height: CGFloat = 56
        
        public struct Hollow {
            public static var height = 44
            public static var borderColor = Color.cream
        }
        
    }
    
    public struct TextField {
        
        public static var height : CGFloat = 66
        public static var width : CGFloat  = 200
        public static var bottomBorderColor = Color.grayLight
        
    }
    
    public struct Menu {
        public static var transitionDuration = 0.5
    }
    
}