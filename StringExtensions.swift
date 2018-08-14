//
//  StringExtensions.swift
//  BetterKit
//
//  Created by Jangle's MacBook Pro on 8/14/18.
//

import Foundation

extension String {
    func matches(pattern: String, options: NSRegularExpression.Options = [], matchingOptions: NSRegularExpression.MatchingOptions = []) -> Bool {
        var expression: NSRegularExpression!
        do {
            expression = try NSRegularExpression(pattern: pattern, options: options)
        } catch {
            print("Invalid pattern: %@\n%@", pattern, error)
            return false
        }
        return matches(expression, matchingOptions: matchingOptions)
    }
    
    func matches(_ input: NSRegularExpression?, matchingOptions: NSRegularExpression.MatchingOptions = []) -> Bool {
        guard let input = input else { return false }
        let range = NSRange(location: 0, length: self.count)
        return input.firstMatch(in: self, options: matchingOptions, range: range)?.range == range
    }
}
