//
//  Swizzler.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

internal class Swizzler {
    static func swizzleInstanceSelector(instance: NSObject, origSelector: Selector, newSelector: Selector) {
        let aClass: AnyClass = object_getClass(instance)!
        
        let origMethod = class_getInstanceMethod(aClass, origSelector)!
        let newMethod = class_getInstanceMethod(aClass, newSelector)!
        
        method_exchangeImplementations(origMethod, newMethod)
    }
}
