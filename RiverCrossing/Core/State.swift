//
//  State.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 05/04/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

struct State {
    
    enum Direction: String {
        case rightToLeft = "<=="
        case leftToRight = "==>"
        
        var opposite: Direction {
            return self == .leftToRight ? .rightToLeft : .leftToRight
        }
    }
    
    let rightSide: [String]
    let leftSide: [String]
    let direction: Direction
    
    var isSafe: Bool {
        return leftSide.isMissionariesSafe && rightSide.isMissionariesSafe
    }
    
    var isSolved: Bool {
        return leftSide.count == 6
    }
    
    var description: String {
        return "\(rightSide) \(direction.opposite.rawValue) \(leftSide)\n"
    }
}
