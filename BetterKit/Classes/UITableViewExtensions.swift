
//  UITableViewExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

@objc extension UITableView {
    /**
     Reloads the rows and sections of the tableView with an animation.
     
     :param: animated      Whether the reload should be animated
     :param: completion    A block to be invoked when the animation is completed
     */
    @objc open func reloadData(_ animated: Bool, completion: (()->Void)? = nil) {
        if !animated {
            reloadData()
            completion?()
        } else {
            reloadData(animation: .none, completion: completion)
        }
    }
    
    /**
     Reloads the rows and sections of the tableView with an animation.
     
     :param: animation     The specific animation type to use
     :param: completion    A block to be invoked when the animation is completed
     */
    @objc open func reloadData(animation: UITableView.RowAnimation, completion: (()->Void)? = nil) {
        _reloadData(animation: animation, completion: completion)
    }
}
