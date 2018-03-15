//
//  Swizzling.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

internal extension NSObject
{
    private static var firstOccurrence = true
    
//    static func implementNetfox() {
//        guard firstOccurrence else { return }
//        firstOccurrence = false
//
//        // First let's make sure setter: URLSessionConfiguration.protocolClasses is de-duped
//        // This ensures NFXProtocol won't be added twice
//        swizzleProtocolSetter()
//
//        // Now, let's make sure NFXProtocol is always included in the default configuration(s)
//        // Adding it twice won't be an issue anymore, because we've de-duped the setter
//        swizzleDefault()
//    }
//
//    private static func swizzleProtocolSetter() {
//        let instance = URLSessionConfiguration.default
//
//        let aClass: AnyClass = object_getClass(instance)!
//
//        let origSelector = #selector(setter: URLSessionConfiguration.protocolClasses)
//        let newSelector = #selector(setter: URLSessionConfiguration.protocolClasses_Swizzled)
//
//        let origMethod = class_getInstanceMethod(aClass, origSelector)!
//        let newMethod = class_getInstanceMethod(aClass, newSelector)!
//
//        method_exchangeImplementations(origMethod, newMethod)
//    }
//
//    private var protocolClasses_Swizzled: [AnyClass]? {
//        get {
//            // Unused, but required for compiler
//            return self.protocolClasses_Swizzled
//        }
//        set {
//            guard let newTypes = newValue else { self.protocolClasses_Swizzled = nil; return }
//
//            var types = [AnyClass]()
//
//            // de-dup
//            for newType in newTypes {
//                if !types.contains(where: { (existingType) -> Bool in
//                    existingType == newType
//                }) {
//                    types.append(newType)
//                }
//            }
//
//            self.protocolClasses_Swizzled = types
//        }
//    }
//
//    private static func swizzleDefault() {
//        let aClass: AnyClass = object_getClass(self)!
//
//        let origSelector = #selector(getter: URLSessionConfiguration.default)
//        let newSelector = #selector(getter: URLSessionConfiguration.default_swizzled)
//
//        let origMethod = class_getClassMethod(aClass, origSelector)!
//        let newMethod = class_getClassMethod(aClass, newSelector)!
//
//        method_exchangeImplementations(origMethod, newMethod)
//    }
//
//    private class var default_swizzled: URLSessionConfiguration {
//        get {
//            let config = URLSessionConfiguration.default_swizzled
//
//            // Let's go ahead and add in NFXProtocol, since it's safe to do so.
//            config.protocolClasses?.insert(NFXProtocol.self, at: 0)
//
//            return config
//        }
//    }
    
    
}
