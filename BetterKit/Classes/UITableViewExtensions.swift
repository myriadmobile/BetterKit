
//  UITableViewExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

@objc extension UITableView {
    
    @objc open func reloadData(_ animated: Bool, completion: (()->Void)? = nil) {
        guard animated else { reloadData(); completion?(); return }
        reloadData(animation: .none, completion: completion)
    }
    
    @objc open func reloadData(animation: UITableViewRowAnimation, completion: (()->Void)? = nil) {
        _reloadData(animation: animation, completion: completion)
    }
}
