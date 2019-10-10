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
     NOTE: Betterkit sets the forces fullscreen on all presentations by default.
     WARN: Forces storyboard modal displays to always be fullscreen.
     :param: viewControllerToPresent    The view controller to present
     :param: modalPresentationStyle     The modal style to present the view in
     :param: animated                   Whether the view will appear is animated
     :param: completion                 Called on the presentation's completion
    */
    func present(_ viewControllerToPresent: UIViewController, modalPresentationStyle: UIModalPresentationStyle, animated: Bool, completion: (() -> Void)?) {
        viewControllerToPresent.modalPresentationStyle = modalPresentationStyle
        present_swizzled(viewControllerToPresent, animated: animated, completion: completion)
    }
}
