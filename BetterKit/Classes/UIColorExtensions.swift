//
//  UIColorExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

public extension UIColor {
    
    /**
     Generates a random UIColor.
     
     :returns:    A random UIColor
     */
    public static var random: UIColor {
        get { return UIColor(red: Int.random % 256, green: Int.random % 256, blue: Int.random % 256, alpha: 255) }
    }
    
    /**
     Initializes and returns a color object using the specified opacity and RGB component values using integers between 0 and 255.
     
     :param: red      An Int specifying the red component between 0 and 255
     :param: green    An Int specifying the green component between 0 and 255
     :param: blue     An Int specifying the blue component between 0 and 255
     :param: alpha    An Int specifying the alpha component between 0 and 255
     */
    convenience init(red: Int, green: Int, blue: Int, alpha: Int = 255) {
        assert(red >= 0x00 && red <= 0xFF, "Invalid red component")
        assert(green >= 0x00 && green <= 0xFF, "Invalid green component")
        assert(blue >= 0x00 && blue <= 0xFF, "Invalid blue component")
        assert(alpha >= 0x00 && alpha <= 0xFF, "Invalid alpha component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 255.0)
    }
    
    /**
     Initializes and returns a color object using the specified opacity and HEX component values.  EX: 0xAABBCC.
     
     :param: hexComponent    An Int specifying the hex component
     :param: alpha           An Int specifying the alpha component between 0 and 255
     */
    convenience init(hexComponent: Int, alpha: Int = 255) {
        assert(hexComponent >= 0x000000 && hexComponent <= 0xFFFFFF, "Invalid hexComponent component")
        assert(alpha >= 0x00 && alpha <= 0xFF, "Invalid alpha component")
        
        self.init(
            red: (hexComponent >> 16) & 0xFF,
            green: (hexComponent >> 8) & 0xFF,
            blue: hexComponent & 0xFF,
            alpha: alpha
        )
    }
    
    /**
     Initializes and returns a color object using the specified opacity and HEX component values.  EX: #AABBCC.
     
     :param: hexString    A string specifying the hex component
     */
    convenience init(hexString: String) {
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
        self.init(red: Int(r), green: Int(g), blue: Int(b), alpha: Int(a))
    }
        
}
