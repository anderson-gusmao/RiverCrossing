//
//  Combine.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Combine {
    
    func generateChindren(state: State) -> [State] {
        switch state.direction {
        case .leftToRight:
            return createNewStates(leaving: state.leftSide, staying: state.rightSide, direction: state.direction)
        case .rightToLeft:
            return createNewStates(leaving: state.rightSide, staying: state.leftSide, direction: state.direction)
        }
    }
}

private extension Combine {
    
    func createNewStates(leaving: [String], staying: [String], direction: State.Direction) -> [State] {
        var possibilities = [[String]]()
        var states = [State]()
        
        for i in 0...leaving.count-1 {
            guard leaving.count > 1 else {
                possibilities = [leaving]
                break
            }
            let p1 = [leaving[i]]
            if !possibilities.contains(p1) { possibilities.append(p1) }
            for j in i...leaving.count-1 {
                let p1 = leaving[i]
                let p2 = leaving[j]
                if !possibilities.contains([p1, p2]) { possibilities.append([p1, p2]) }
            }
        }
        
        possibilities.forEach { possibility in
            var newLeaving = leaving
            var newStaying = staying
            possibility.forEach({
                if let index = newLeaving.lastIndex(of: $0) {
                    newStaying.append(newLeaving.remove(at: index))
                }
            })
            switch direction {
            case .leftToRight:
                states.append(State(rightSide: newStaying, leftSide: newLeaving, direction: direction.opposite))
            case .rightToLeft:
                states.append(State(rightSide: newLeaving, leftSide: newStaying, direction: direction.opposite))
            }
            
        }
        
        return states
    }
}
