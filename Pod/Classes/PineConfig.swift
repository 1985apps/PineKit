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
        public static var blueLight = UIColor(red:0.345, green:0.702, blue:0.863, alpha:1.00)
        public static var red = UIColor(red:0.851, green:0.345, blue:0.341, alpha:1.00)
        public static var cream = UIColor(red:0.765, green:0.796, blue:0.820, alpha:1.00)
        public static var purple = UIColor(red:0.196, green:0.188, blue:0.369, alpha:1.00)
        public static var purpleLight = UIColor(red:0.506, green:0.522, blue:0.839, alpha:1.00)
        public static var grayLight = UIColor(red:0.957, green:0.961, blue:0.969, alpha:1.00)
        public static var grayExtraLight = UIColor(red:0.953, green:0.957, blue:0.961, alpha:1.00)

        // NAMED COLORS
        public static var primary = blue
    }

    public struct Size {
        public static var icon = CGSize(width: 44, height: 44)
    }

    public class Font {

        public static var REGULAR = "HelveticaNeue"
        public static var BOLD = "HelveticaNeue-Bold"
        public static var LIGHT = "HelveticaNeue-Light"

        public static func get(type: String = REGULAR, size: CGFloat = 17.0) -> UIFont {
            return UIFont(name: type, size: size)!
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

        public static var height : CGFloat = 50
        public static var width : CGFloat  = 200
        public static var bottomBorderColor = Color.grayLight

    }

    public struct Menu {
        public static var transitionDuration = 0.5

        public struct Transition {

            public static var duration = Menu.transitionDuration

            public struct Squeeze {

                public static var by : CGFloat = 80
                public static var x : CGFloat  = 150

            }

        }
    }
    
    public struct Switch {
        public static var onTintColor = PineConfig.Color.blueLight
    }

    public struct NavigationBar {

        public static var height: CGFloat = 44
        public static var heightWithStatusBar: CGFloat = 20 + NavigationBar.height
    }

    public struct Graph {

        public static var gridLineColor = Color.grayExtraLight

    }

}

/* EXTENTION TO THE UIVIEW */

extension UIView {
    
    func addSubviews(views: [UIView]){
        for view in views {
            self.addSubview(view)
        }
    }
    
}
