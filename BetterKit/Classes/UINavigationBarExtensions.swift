//
//  UINavigationBarExtensions.swift
//  BetterKit
//
//  Created by Jangle's MacBook Pro on 7/11/18.
//

import Foundation

extension UINavigationBar {
    var isTransparent: Bool {
        get { return backgroundImage(for: .default) != nil && shadowImage != nil && isTranslucent }
        set {
            setBackgroundImage(newValue ? UIImage() : nil, for: .default)
            shadowImage = newValue ? UIImage() : nil
            isTranslucent = newValue
        }
    }
}
