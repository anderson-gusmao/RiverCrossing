//
//  Array+Helpers.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 07/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//
import Foundation

extension Array where Iterator.Element == String {
    
    var missionariesQuantity: Int {
        let missionaries = filter({ $0 == "M" })
        return missionaries.count
    }
    
    var cannibalQuantity: Int {
        let cannibals = filter({ $0 == "C" })
        return cannibals.count
    }
    
    var isMissionariesSafe: Bool {
        return missionariesQuantity == 0 || missionariesQuantity >= cannibalQuantity
    }
    
    var length: Int {
        return count - 1
    }
}
