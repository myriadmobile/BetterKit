//
//  TickTock.swift
//  BetterKit
//
//  Created by Jangle's MacBook Pro on 7/10/18.
//

import Foundation

private var time: DispatchTime?
private let NANO_SECONDS_PER_SECOND = 0.000000001

public func tick() {
    time = DispatchTime.now()
}

public func tock() {
    if let time = time {
        let nanoseconds = DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds
        let seconds = Double(nanoseconds) * NANO_SECONDS_PER_SECOND
        
        print("----tock----\n\(seconds)s\n------------")
    } else {
        print("tick() was not invoked")
    }
}
