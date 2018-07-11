//
//  UIColorExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

@objc extension UIColor {
    
    /**
     Generates a random UIColor.
     
     :returns:    A random UIColor
     */
    @objc public static var random: UIColor {
        get { return UIColor(redInt: Int.random % 256, greenInt: Int.random % 256, blueInt: Int.random % 256, alphaInt: 255) }
    }
    
    /**
     Initializes and returns a color object using the specified opacity and RGB component values using integers between 0 and 255.
     
     :param: red      An Int specifying the red component between 0 and 255
     :param: green    An Int specifying the green component between 0 and 255
     :param: blue     An Int specifying the blue component between 0 and 255
     :param: alpha    An Int specifying the alpha component between 0 and 255
     */
    @objc public convenience init(redInt: Int, greenInt: Int, blueInt: Int, alphaInt: Int = 255) {
        assert(redInt >= 0x00 && redInt <= 0xFF, "Invalid red component")
        assert(greenInt >= 0x00 && greenInt <= 0xFF, "Invalid green component")
        assert(blueInt >= 0x00 && blueInt <= 0xFF, "Invalid blue component")
        assert(alphaInt >= 0x00 && alphaInt <= 0xFF, "Invalid alpha component")

        self.init(red: CGFloat(redInt) / 255.0, green: CGFloat(greenInt) / 255.0, blue: CGFloat(blueInt) / 255.0, alpha: CGFloat(alphaInt) / 255.0)
    }
    
    /**
     Initializes and returns a color object using the specified opacity and HEX component values.  EX: 0xAABBCC.
     
     :param: hexComponent    An Int specifying the hex component
     :param: alpha           An Int specifying the alpha component between 0 and 255
     */
    @objc public convenience init(hexComponent: Int, alpha: Int = 255) {
        assert(hexComponent >= 0x000000 && hexComponent <= 0xFFFFFF, "Invalid hexComponent component")
        assert(alpha >= 0x00 && alpha <= 0xFF, "Invalid alpha component")
        
        self.init(
            redInt: (hexComponent >> 16) & 0xFF,
            greenInt: (hexComponent >> 8) & 0xFF,
            blueInt: hexComponent & 0xFF,
            alphaInt: alpha
        )
    }
    
    /**
     Initializes and returns a color object using the specified opacity and HEX component values.  EX: #AABBCC.
     
     :param: hexString    A string specifying the hex component
     */
    @objc public convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(redInt: Int(r), greenInt: Int(g), blueInt: Int(b), alphaInt: Int(a))
    }
        
}
