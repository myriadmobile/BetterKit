//
//  BoolExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation
extension Bool {
    /**
     Used to do a C-style && concatenation.  Equivalent of (left = left && right).
     
     :param: left     The left side of the concatenation
     :param: right    The right side of the concatenation
     */
    static func &=(left: inout Bool, right: Bool) -> Bool {
        left = left && right
        return left
    }
    
    /**
     Used to do a C-style || concatenation.  Equivalent of (left = left || right).
     
     :param: left     The left side of the concatenation
     :param: right    The right side of the concatenation
     */
    static func |=(left: inout Bool, right: Bool) -> Bool {
        left = left || right
        return left
    }
}
