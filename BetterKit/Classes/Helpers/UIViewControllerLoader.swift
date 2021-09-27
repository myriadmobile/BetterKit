//
//  UIViewControllerLoader.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

private struct AssociatedKeys {
    static var firstWillAppear: UInt8 = 0
    static var firstWillAppearDispatch: UInt8 = 0
    static var firstDidAppear: UInt8 = 0
    static var firstDidAppearDispatch: UInt8 = 0
    static var firstPresentDispatch: UInt8 = 0
}

@objc internal extension UIViewController {
    
    @objc private class func loadExtension() {
        DispatchOnce.load(key: &AssociatedKeys.firstWillAppearDispatch).perform {
            Swizzler.swizzleInstanceSelector(class: UIViewController.self, origSelector: #selector(viewWillAppear(_:)),
                                             newSelector: #selector(viewWillAppear_swizzled(_:)))
        }
        
        DispatchOnce.load(key: &AssociatedKeys.firstDidAppearDispatch).perform {
            Swizzler.swizzleInstanceSelector(class: UIViewController.self, origSelector: #selector(viewDidAppear(_:)),
                                             newSelector: #selector(viewDidAppear_swizzled(_:)))
        }
    }
    
    @objc func viewWillAppear_swizzled(_ animated: Bool) {
        viewWillAppear_swizzled(animated)
        
        if !firstWillAppearFlag {
            firstWillAppearFlag = true
            viewWillFirstAppear(animated)
        }
    }
    
    @objc func viewDidAppear_swizzled(_ animated: Bool) {
        viewDidAppear_swizzled(animated)
        
        if !firstDidAppearFlag {
            firstDidAppearFlag = true
            viewDidFirstAppear(animated)
        }
    }
    
    private var firstWillAppearFlag: Bool {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.firstWillAppear) as? Bool ?? false }
        set(newValue) { objc_setAssociatedObject(self, &AssociatedKeys.firstWillAppear, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    private var firstDidAppearFlag: Bool {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.firstDidAppear) as? Bool ?? false }
        set(newValue) { objc_setAssociatedObject(self, &AssociatedKeys.firstDidAppear, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}
