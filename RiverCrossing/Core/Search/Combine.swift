//
//  Combine.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Combine {
    
    let input: [String]
    let grouping: Int
    
    init(input: [String], grouping: Int = 2) {
        self.input = input
        self.grouping = grouping
    }
    
    func generate() -> [[String]] {
        var output = [[String]]()
        for k in 1...grouping { output.append(contentsOf: combos(elements: input, k: k)) }
        return Array(Set(output))
    }
}

private extension Combine {
    
    func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] {
        guard k != 0 else { return [[]] }
        guard let first = elements.first else { return [] }
        let head = [first]
        let subcombos = combos(elements: elements, k: k - 1)
        var ret = subcombos.map { head + $0 }
        ret += combos(elements: elements.dropFirst(), k: k)
        
        return ret
    }
    
    func combos<T>(elements: Array<T>, k: Int) -> [[T]] {
        return combos(elements: ArraySlice(elements), k: k)
    }
}
