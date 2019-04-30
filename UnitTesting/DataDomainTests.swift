//
//  DataDomainTests.swift
//  UnitTesting
//
//  Created by Anderson Gusmao on 11/04/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import XCTest

class DataDomainTests: XCTestCase {

    private var dataDomain = DataDomain()

    func testInitialState() {
        let input = [DataDomain.cannibal,
                     DataDomain.cannibal,
                     DataDomain.cannibal,
                     DataDomain.missionary,
                     DataDomain.missionary,
                     DataDomain.missionary]

        let possibilities = dataDomain.evaluatePossibilities(input: input)
        XCTAssertEqual(possibilities.count, 5)
        XCTAssertTrue(possibilities.contains([DataDomain.cannibal]))
        XCTAssertTrue(possibilities.contains([DataDomain.missionary]))
        XCTAssertTrue(possibilities.contains([DataDomain.cannibal, DataDomain.cannibal]))
        XCTAssertTrue(possibilities.contains([DataDomain.cannibal, DataDomain.missionary]))
        XCTAssertTrue(possibilities.contains([DataDomain.missionary, DataDomain.missionary]))
    }

    func testOnlyCannibals() {
        let input = [DataDomain.cannibal,
                     DataDomain.cannibal,
                     DataDomain.cannibal]

        let possibilities = dataDomain.evaluatePossibilities(input: input)
        XCTAssertEqual(possibilities.count, 2)
        XCTAssertTrue(possibilities.contains([DataDomain.cannibal]))
        XCTAssertFalse(possibilities.contains([DataDomain.missionary]))
        XCTAssertTrue(possibilities.contains([DataDomain.cannibal, DataDomain.cannibal]))
        XCTAssertFalse(possibilities.contains([DataDomain.cannibal, DataDomain.missionary]))
        XCTAssertFalse(possibilities.contains([DataDomain.missionary, DataDomain.missionary]))
    }

    func testOnlyMissionaries() {
        let input = [DataDomain.missionary,
                     DataDomain.missionary,
                     DataDomain.missionary]

        let possibilities = dataDomain.evaluatePossibilities(input: input)
        XCTAssertEqual(possibilities.count, 2)
        XCTAssertFalse(possibilities.contains([DataDomain.cannibal]))
        XCTAssertTrue(possibilities.contains([DataDomain.missionary]))
        XCTAssertFalse(possibilities.contains([DataDomain.cannibal, DataDomain.cannibal]))
        XCTAssertFalse(possibilities.contains([DataDomain.cannibal, DataDomain.missionary]))
        XCTAssertTrue(possibilities.contains([DataDomain.missionary, DataDomain.missionary]))
    }

    func testOnlyOneMissionaryAndOneCannibal() {
        let input = [DataDomain.missionary,
                     DataDomain.cannibal]

        let possibilities = dataDomain.evaluatePossibilities(input: input)
        XCTAssertEqual(possibilities.count, 3)
        XCTAssertTrue(possibilities.contains([DataDomain.cannibal]))
        XCTAssertTrue(possibilities.contains([DataDomain.missionary]))
        XCTAssertFalse(possibilities.contains([DataDomain.cannibal, DataDomain.cannibal]))
        XCTAssertTrue(possibilities.contains([DataDomain.missionary, DataDomain.cannibal]))
        XCTAssertFalse(possibilities.contains([DataDomain.missionary, DataDomain.missionary]))
    }
}
