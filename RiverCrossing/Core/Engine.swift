//
//  Engine.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Engine {
    
    let initalState = State(rightSide: ["C","C","C","M", "M","M"],
                            leftSide: [],
                            direction: State.Direction.rightToLeft)
    
    func run() {
        var queue = Queue<Node<State>>()
        Combine().generateChindren(state: initalState).forEach { queue.enqueue(Node<State>(value: $0)) }
        process(&queue)
    }
}

private extension Engine {
    
    func process(_ queue: inout Queue<Node<State>>) {
        while let item = queue.dequeue() {
            var exit = false
            Combine().generateChindren(state: item.value).forEach {
                if $0.leftSide.isMissionariesSafe && $0.rightSide.isMissionariesSafe && $0.rightSide.count < 6 {
                    let newNode = Node<State>(value: $0)
                    newNode.parent = item
                    queue.enqueue(newNode)
                    if $0.leftSide.count == 6 {
                        printNode(node: newNode)
                        exit = true
                    }
                } else {
                    item.setFailed()
                }
            }
            if exit { break }
        }
    }
    
    func printNode(node: Node<State>?) {
        guard let parent = node?.parent else {
            if let value = node?.value {
                print("\(value.rightSide) \(value.direction.opposite.rawValue) \(value.leftSide)")
            }
            return
        }
        if let value = node?.value {
            print("\(value.rightSide) \(value.direction.opposite.rawValue) \(value.leftSide)")
        }
        printNode(node: parent)
    }
}
