//
//  Duality.swift
//  Duality
//
//  Created by rishi on 12/10/18.
//  Copyright © 2018 Rishi Thakkar. All rights reserved.
//

/*
 create timer that has inner count var that increments on timer call
 
 one timer class can be used for both duality timers as timer is only for increments however each duality timer must have it's
 own var for time value
 
 two booleans: isTopActive, isPaused OR use enum state: .active or .waiting
 if(isPaused)
 donothing()
 if(isTopActive)
 increment top w/ timer
 else
 increment bottom
 reset vars for incrmeentation every 24 hours or on reset button
 maybe allow logging here for every day. // -- STORE DATA in .txt file build UI later
 
 
 ========= LINKS =========
 - https://www.hackingwithswift.com/articles/117/the-ultimate-guide-to-timer
 - https://www.youtube.com/watch?v=5B5IRK9wYjI&t=0s&index=9&list=PLPA-ayBrweUzGFmkT_W65z64MoGnKRZMq
 - https://www.raywenderlich.com/1073-model-view-controller-mvc-in-ios-a-modern-approach
*/


import Foundation

class Duality {
    public var topTime: Int // time for top timer in seconds
    public var bottomTime: Int // time for bottom timer in seconds
    public var isTopActive: Bool // boolean to check if top is paused/active
    public var isBottomActive: Bool // boolean to check if bottom is paused/active
    /* isTopActive and isBottomActive are both set to false if both are paused */
    
    /* no args constructor initializes all fields to 0 or false */
    public init() {
        topTime = 0
        bottomTime  = 0
        isTopActive = false
        isBottomActive = false
    }
    /* if parameter = 1 topTime is incremented forward by 1 second if not 1 bottom incremented by 1 second */
    public func increment(decider : Int) {
        // NOTE: this function is very "hacky" in future timer class could just be called when timers need to be incremented
        decider == 1 ? (topTime += 1) : (bottomTime += 1)
    }
    
    /* should be called every 24 hours or at user set time */
    public func resetTimers() {
        topTime = 0
        bottomTime = 0
    }
    
}
