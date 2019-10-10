//
//  UIViewControllerExtensions.swift
//  BetterKit
//
//  Created by Nathan Jangula on 3/15/18.
//

import Foundation

@objc extension UIViewController {
    /**
     Notifies the view controller that its view is about to be added to a view hierarchy for the first time.
     
     :param: animated    Whether the view will appear animated
     */
    @objc open func viewWillFirstAppear(_ animated: Bool) { }
    
    /**
     Notifies the view controller that its view was added to a view hierarchy for the first time.
     
     :param: animated    Whether the view did appear animated
     */
    @objc open func viewDidFirstAppear(_ animated: Bool) { }
    
    /**
     Presents the view controller with a modal layout.
     :param: viewControllerToPresent    The view controller to present
     :param: modalPresentationStyle     The modal style to present the view in
     :param: animated                   Whether the view will appear is animated
     :param: completion                 Called on the presentation's completion
    */
    public func present(_ viewControllerToPresent: UIViewController, modalPresentationStyle: UIModalPresentationStyle, animated: Bool, completion: (() -> Void)?) {
        viewControllerToPresent.modalPresentationStyle = modalPresentationStyle
        present(viewControllerToPresent, animated: animated, completion: completion)
    }
}
