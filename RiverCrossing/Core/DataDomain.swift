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

    private var availableCombination = [[cannibal], [missionary], [cannibal, cannibal], [cannibal, missionary], [missionary, missionary]]

    typealias Model = String

    func evaluatePossibilities(input: [String]) -> [[String]] {
        var output = [[String]]()

        for ac in availableCombination {
            guard ac.count == 2 else {
                if let first = ac.first, let i = input.firstIndex(of: first) {
                    output.append([input[i]])
                }
                continue
            }
            if let first = ac.first, let last = ac.last, let i = input.firstIndex(of: first), let j = input.firstIndex(of: last), input.contains(first) && input.contains(last) {
                output.append([input[i], input[j]])
            }
        }

        return output
    }
}
