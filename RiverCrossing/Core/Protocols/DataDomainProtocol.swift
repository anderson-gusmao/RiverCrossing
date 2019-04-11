//
//  DataDomainProtocol.swift
//  RiverCrossing
//
//  Created by Anderson Gusmao on 11/04/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import Foundation

protocol DataDomainProtocol {

    associatedtype Model

    func evaluatePossibilities(input: [Model]) -> [[Model]]
}
