//
//  InterestingTips.swift
//  AdvancedSwiftPractice
//
//  Created by yansong li on 2016-01-25.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

// 1. the first interesting thing is about @nonescape

func someFunctionWithEscapeBlock(block: ()->()) {
    consumer(block)
    consumer() {
        print("Before this block is consumed")
        block()
        print("I have consume this block")
    }
}

/**
 Function with `@noescape let x = x` keyword
 
 - parameter block: **@noescape** keyword
 
 - Note: uncomment it to see the error yourself
 */
 //func someFunctionWithNoEscapeBlock(@noescape block: ()->()) {
 //  consumer(block)
 //}

func consumer(consumeBlock: ()->Void) {
    var savedBlock = consumeBlock
}


// 2. INLINE LAZY VARS
class KrakenFoodGenerator {
    lazy var lazyFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        return formatter
    }()
    
    func printTime() {
        let timeStamp1 = NSDate()
        let dateString = lazyFormatter.stringFromDate(timeStamp1)
        print(dateString)
        let timeStamp2 = NSDate()
        let dateString2 = lazyFormatter.stringFromDate(timeStamp2)
        print(dateString2)
    }
}


