//
//  UINavigationControllerExtensions.swift
//  BetterKit
//
//  Created by Jangle's MacBook Pro on 7/10/18.
//

import UIKit

extension UINavigationController {
    /**
     Pops back to the most recent view controller in the navigation stack that matches the type specified.
     
     :param: ofType      The type of view controller to pop back to
     :param: animated    Whether the pop should be animated
     */
    open func popToFirstViewController<T: UIViewController>(ofType: T.Type, animated: Bool) {
        if let vc = self.viewControllers.reversed().first(where: {$0 is T}) {
            self.popToViewController(vc, animated: animated)
        }
    }
}
