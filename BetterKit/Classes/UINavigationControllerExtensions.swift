//
//  UINavigationControllerExtensions.swift
//  BetterKit
//
//  Created by Jangle's MacBook Pro on 7/10/18.
//

import UIKit

extension UINavigationController {
    func popToFirstViewController<T: UIViewController>(ofType: T.Type, animated: Bool) {
        if let vc = self.viewControllers.reversed().first(where: {$0 is T}) {
            self.popToViewController(vc, animated: animated)
        }
    }
}
