
//  UITableViewExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

@objc extension UITableView {
    
    @objc open func reloadData(_ animated: Bool, completion: (()->Void)? = nil) {
        if !animated {
            reloadData()
            completion?()
        } else {
            reloadData(animation: .none, completion: completion)
        }
    }
    
    @objc open func reloadData(animation: UITableViewRowAnimation, completion: (()->Void)? = nil) {
        _reloadData(animation: animation, completion: completion)
    }
}
