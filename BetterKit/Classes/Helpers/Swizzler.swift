//
//  Swizzler.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

internal class Swizzler {
    static func swizzleInstanceSelector(class aClass: AnyClass, origSelector: Selector, newSelector: Selector) {
        let origMethod = class_getInstanceMethod(aClass, origSelector)!
        let newMethod = class_getInstanceMethod(aClass, newSelector)!
        
        method_exchangeImplementations(origMethod, newMethod)
    }
}
