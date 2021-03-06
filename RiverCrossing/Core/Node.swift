//
//  Node.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Node<T> {
    
    var value: T
    var parent: Node<T>?
    
    init(value: T, parent: Node<T>? = nil) {
        self.value = value
        self.parent = parent
    }
}
