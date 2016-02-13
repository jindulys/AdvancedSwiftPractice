//
//  StructAndClass.swift
//  AdvancedSwiftPractice
//
//  Created by yansong li on 2016-02-13.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation

// In recent years, there has been an emerging consensus that immutability and value types can help resolve many of the issues that arise when doing multi-threaded programming.

class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// What if a struct has a class property, how the copy work. In my mind, the new struct's property will have the same reference value to some object.

// Copy on write. When we define our own struct and pass it around. the trick is define a custom accessor for the property we want to manually copy.

// isUniquelyReferencedNonObjC could detect whether a pointer is uniquely referenced. but it only works with Swift objects. To work around, we create a simple wrapper type, Box.

final class Box<T> {
    var unbox: T
    init(_ value: T) { unbox = value }
}


// Transferring money between bank accounts


// Method 1: classes 

// disadvantage: Could not work in multithread environment. become interleaved with another thread.

typealias USDDollars = Int

class Account {
    var funds: USDDollars
    init(_ value: USDDollars) {
        funds = value
    }
}

func transfer(amount: USDDollars, source: Account, destination: Account) -> Bool {
    guard source.funds >= amount else { return false }
    source.funds -= amount
    destination.funds += amount
    return true
}


struct AccountS {
    var funds: USDDollars
}

func transfer(amount: USDDollars, inout source: AccountS, inout destination: AccountS) -> Bool {
    guard source.funds >= amount else { return false }
    source.funds -= amount
    destination.funds += amount
    return true
}
