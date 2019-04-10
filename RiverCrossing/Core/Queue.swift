//
//  Queue.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 07/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

struct Queue<T> {
    
    private var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    mutating func clean() {
        array.removeAll()
    }
}
