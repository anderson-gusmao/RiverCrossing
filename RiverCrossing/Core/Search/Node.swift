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
    
    var children = [Node]()
    private(set) var state = State.inProgress
    var value: T?
    var hasChindren: Bool { return children.count > 0 }
    
    init(children: [Node] = [Node](), value: T? = nil) {
        self.children = children
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
    }
    
    func setFailed() {
        state = .failed
    }
}
