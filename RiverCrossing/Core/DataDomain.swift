//
//  DataDomain.swift
//  RiverCrossing
//
//  Created by Anderson Gusmao on 11/04/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class DataDomain: DataDomainProtocol {

    static var cannibal = "C"
    static var missionary = "M"

    typealias Model = String

    func evaluatePossibilities(input: [String]) -> [[String]] {
        var output = [[String]]()
        let uniqueValues = Set(allCombinations(input: input))
        
        for unique in uniqueValues {
            let splitted = unique.split(separator: ";").map { String($0) }
            guard splitted.count == 2, let first = splitted.first, let last = splitted.last else {
                if let first = splitted.first { output.append([first]) }
                continue
            }
            output.append([first, last])
        }
        
        return output
    }
}

extension DataDomain {
    
    func allCombinations(input: [String]) -> [String] {
        var output = [String]()
        for i in 0...input.length {
            output.append("\(input[i])")
            for j in i...input.length {
                guard j != i else { continue }
                output.append("\(input[i]);\(input[j])")
            }
        }
        return output
    }
}
