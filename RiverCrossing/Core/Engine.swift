//
//  Engine.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Engine {
    
    var solution = String()
    let initalState: State
    
    init(initialState:  State) {
        self.initalState = initialState
    }
    
    func run() -> String {
        var queue = Queue<Node<State>>()
        queue.enqueue(Node<State>(value: initalState))
        return process(&queue)
    }
}

private extension Engine {
    
    func process(_ queue: inout Queue<Node<State>>) -> String {
        while let item = queue.dequeue(), solution.isEmpty {
            Combine().generateChindren(state: item.value).forEach {
                if $0.isSafe {
                    let newNode = Node<State>(value: $0)
                    newNode.parent = item
                    queue.enqueue(newNode)
                    if $0.isSolved {
                         solution = printNode(node: newNode)
                    }
                } else {
                    item.setFailed()
                }
            }
        }
        return solution
    }
    
    func printNode(node: Node<State>?) -> String {
        guard let parent = node?.parent else {
            if let value = node?.value {
                solution += "\(value.rightSide) \(value.direction.opposite.rawValue) \(value.leftSide)\n"
            }
            return solution
        }
        if let value = node?.value {
            solution += "\(value.rightSide) \(value.direction.opposite.rawValue) \(value.leftSide)\n"
        }
        return printNode(node: parent)
    }
}
