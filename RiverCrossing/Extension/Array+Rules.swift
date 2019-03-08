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
        let missionaries = filter({ $0 == Engine.missionary })
        return missionaries.count
    }
    
    var cannibalQuantity: Int {
        let cannibals = filter({ $0 == Engine.cannibal })
        return cannibals.count
    }
    
    var isMissionariesSafe: Bool {
        return cannibalQuantity <= missionariesQuantity
    }
}
