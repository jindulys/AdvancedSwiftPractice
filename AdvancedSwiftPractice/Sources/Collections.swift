//
//  Collections.swift
//  AdvancedSwiftPractice
//
//  Created by yansong li on 2016-01-17.
//  Copyright © 2016 yansong li. All rights reserved.
//

import Foundation


public final class Course {
    var name: String
    var teacher: String
    
    var capacity: Int
    var startDate: NSDate
    
    init(name: String, teacher: String, capacity: Int = 60, startDate: NSDate = NSDate()) {
        self.name = name
        self.teacher = teacher
        self.capacity = capacity
        self.startDate = startDate
    }
}

extension Course: CustomStringConvertible {
    public var description: String {
        return "Course name: \(self.name) taught by: \(self.teacher) capacity: \(self.capacity) startDate: \(self.startDate)"
    }
}

extension Array {
    // My implementation of map
    // Element here is related to the knowledge of generic and I should learn more about it later.
//    func map<U>(transform:(Element) -> U) -> [U] {
//        var tmp: [U] = []
//        for e in self {
//            let ne = transform(e)
//            tmp.append(ne)
//        }
//        return tmp
//    }
    
    // Correct implementation
    func map<U>(transform: Element->U) -> [U] {
        var result: [U] = []
        // I did not think about this.
        result.reserveCapacity(self.count)
        for x in self {
            result.append(transform(x))
        }
        return result
    }
}

extension SequenceType {
    func findElement(match: Generator.Element->Bool) -> Generator.Element? {
        for element in self where match(element) {
            return element
        }
        return nil
    }
}