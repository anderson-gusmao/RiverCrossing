//
//  Combine.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 06/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

final class Combine {
    
    func generateChildren(state: State) -> [State] {
        switch state.direction {
        case .leftToRight:
            return calculatePossibilities(leaving: state.leftSide, staying: state.rightSide, direction: state.direction)
        case .rightToLeft:
            return calculatePossibilities(leaving: state.rightSide, staying: state.leftSide, direction: state.direction)
        }
    }
}

private extension Combine {
    
    func createNewStates(possibilities: [[String]], leaving: [String], staying: [String], direction: State.Direction) -> [State] {
        var states = [State]()
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
    
    func calculatePossibilities(leaving: [String], staying: [String], direction: State.Direction) -> [State] {
        var possibilities = [[String]]()
        
        for i in 0...leaving.length {
            guard leaving.count > 1 else {
                possibilities = [leaving]
                break
            }
            if !possibilities.contains([leaving[i]]) {
                possibilities.append([leaving[i]])
            }
            for j in i...leaving.length {
                if !possibilities.contains([leaving[i], leaving[j]]) {
                    possibilities.append([leaving[i], leaving[j]])
                }
            }
        }
        
        return createNewStates(possibilities: possibilities, leaving: leaving, staying: staying, direction: direction)
    }
}
