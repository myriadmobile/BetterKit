//
//  UIStackViewExtensions.swift
//  BetterKit
//
//  Created by Cole Kainz on 7/10/19.
//

import Foundation
import UIKit

extension UIStackView {
    
    func fullyRemoveAllArrangedSubviews() {
        for subview in self.arrangedSubviews {
            fullyRemoveArrangedSubview(subview)
        }
    }
    
    func fullyRemoveArrangedSubview(_ view: UIView) {
        self.removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
}
