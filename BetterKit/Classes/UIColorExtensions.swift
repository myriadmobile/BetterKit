//
//  UIColorExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

public extension UIColor {
    public static var random: UIColor {
        get { return UIColor(red: CGFloat(Int.random % 256) / 255.0, green: CGFloat(Int.random % 256) / 255.0, blue: CGFloat(Int.random % 256) / 255.0, alpha: 1.0) }
    }
}
