//
//  Node.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Node<T> {
    
    enum State { case failed, inProgress }
    
    private(set) var state = State.inProgress
    var value: T?
    
    init(value: T? = nil) {
        self.value = value
    }
    
    func setFailed() {
        state = .failed
    }
}
