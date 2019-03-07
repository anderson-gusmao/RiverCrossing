//
//  Engine.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Engine {
    
    private var root = Node<String>()
    private let elements = ["C", "C", "C", "M", "M", "M"]
    
    func run() {
        Combine(input: elements).generate().forEach({
            print($0)
        })
    }
}
