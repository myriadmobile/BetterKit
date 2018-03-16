//
//  NSObjectExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

public extension NSObject {
    /// This function allows you to safely try something that would normally throw an uncatchable exception.
    func trySafe(_ block : (() -> Void)?) throws {
        try NSObject.trySafe(block)
    }
    
    /// This function allows you to safely try something that would normally throw an uncatchable exception.
    static func trySafe(_ block : (() -> Void)?) throws {
        try ObjcBlockCatcher.objc_trySafe(block)
    }
}

