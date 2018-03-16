//
//  BoolExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation
extension Bool {
    static func &=(left: inout Bool, right: Bool) -> Bool {
        left = left && right
        return left
    }
    
    static func |=(left: inout Bool, right: Bool) -> Bool {
        left = left || right
        return left
    }
}
