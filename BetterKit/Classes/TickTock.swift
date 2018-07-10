//
//  TickTock.swift
//  BetterKit
//
//  Created by Jangle's MacBook Pro on 7/10/18.
//

import Foundation

private var dispatchTimeCache = [String: DispatchTime]()
private let SECONDS_PER_NANO_SECONDS = 0.000000001

/**
 Starts a timer to measure a duration
 
 :param: tag    A string identifying the timer;  Used to have multiple timers at once
 */
public func tick(_ tag: String = "") {
    dispatchTimeCache[tag] = DispatchTime.now()
}

/**
 Prints out the duration of time since the invocation of tick.
 
 :param: tag    A string identifying the timer;  Used to have multiple timers at once
 */
public func tock(_ tag: String = "") {
    if let time = dispatchTimeCache[tag] {
        let nanoseconds = DispatchTime.now().uptimeNanoseconds - time.uptimeNanoseconds
        let seconds = Double(nanoseconds) * SECONDS_PER_NANO_SECONDS
        
        print("----tock----\n\(seconds)s\n------\(tag)------")
    } else {
        print("tick() was not invoked")
    }
}
