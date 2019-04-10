//
//  Node.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Node<T> {
    
    enum Status { case failed, inProgress }
    
    private(set) var status = Status.inProgress
    var value: T
    var parent: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    
    func setFailed() {
        status = .failed
    }
}
