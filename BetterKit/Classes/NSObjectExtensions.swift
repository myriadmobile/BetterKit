//
//  NSObjectExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

@objc extension NSObject {
    /**
     Allows for safely trying something that would normally throw an uncatchable exception.
     
     :param: block    The block to attempt
     */
    ///
    @objc open func trySafe(_ block : (() -> Void)?) throws {
        try NSObject.trySafe(block)
    }
    
    /**
     Allows for safely trying something that would normally throw an uncatchable exception.
     
     :param: block    The block to attempt
     */
    ///
    @objc open static func trySafe(_ block : (() -> Void)?) throws {
        try ObjcBlockCatcher.objc_trySafe(block)
    }
}

