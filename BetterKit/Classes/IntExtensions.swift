//
//  IntExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

public extension Int {
    public static var random: Int {
        get { return Int(arc4random()) }
    }
}
