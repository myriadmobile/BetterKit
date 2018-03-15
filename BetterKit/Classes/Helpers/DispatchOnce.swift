//
//  DispatchOnce.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

internal class DispatchOnce : NSObject {
    
    private var locked: Bool
    
    @objc public func perform(_ block: () -> Void) {
        if !locked {
            locked = true
            block()
        }
    }
    
    private override init() {
        locked = false
    }
    
    public static func load(key: UnsafeRawPointer) -> DispatchOnce {
        var dispatch = objc_getAssociatedObject(NSObject.self, key) as? DispatchOnce
        
        if dispatch == nil {
            dispatch = DispatchOnce()
            objc_setAssociatedObject(NSObject.self, key, dispatch, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        
        return dispatch!
    }
}
