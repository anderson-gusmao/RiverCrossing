//
//  Engine.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Engine {
    
    static let cannibal = "C"
    static let missionary = "M"
    
    private var rightSide = [cannibal, cannibal, cannibal, missionary, missionary, missionary]
    private var leftSide = [String]()
    
    func run() {
        let possibilities = Combine(input: rightSide).generate().map({ Node(value: $0) })
        enqueue(elements: possibilities)
    }
}

private extension Engine {
    
    func enqueue(elements: [Node<[String]>]) {
        var queue = Queue<Node<[String]>>()
        elements.forEach{ queue.enqueue($0) }
        process(&queue)
    }
    
    func process(_ queue: inout Queue<Node<[String]>>) {
        while let node = queue.dequeue() {
            
            var tempRightSide = rightSide
            var tempLeftSide = leftSide
            
            node.value.forEach({ //Moving to the other side
                guard let i = tempRightSide.firstIndex(of: $0) else { return }
                tempLeftSide.append(tempRightSide.remove(at: i))
            })
            
            if !evaluate(rightSide: tempRightSide, leftSide: tempLeftSide) {
                node.setFailed()
            }
            
            print(node)
        }
    }
    
    func evaluate(rightSide: [String], leftSide: [String]) -> Bool {
        
        return rightSide.isMissionariesSafe
    }
}
