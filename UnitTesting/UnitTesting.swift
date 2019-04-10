//
//  UnitTesting.swift
//  UnitTesting
//
//  Created by Anderson Gusmao on 10/04/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//

import XCTest

class UnitTesting: XCTestCase {

    override func setUp() {
    }

    override func tearDown() {
    }

    func testCheckSolution() {
        let solution = Engine(initialState: State(rightSide: ["C","C","C","M", "M","M"],
                                                  leftSide: [],
                                                  direction: State.Direction.rightToLeft)).run()
        XCTAssertEqual(solution, "[] <== [\"M\", \"M\", \"C\", \"C\", \"C\", \"M\"]\n[\"C\", \"M\"] ==> [\"M\", \"M\", \"C\", \"C\"]\n[\"C\"] <== [\"M\", \"M\", \"M\", \"C\", \"C\"]\n[\"C\", \"C\", \"C\"] ==> [\"M\", \"M\", \"M\"]\n[\"C\", \"C\"] <== [\"C\", \"M\", \"M\", \"M\"]\n[\"M\", \"C\", \"C\", \"M\"] ==> [\"C\", \"M\"]\n[\"M\", \"C\"] <== [\"C\", \"C\", \"M\", \"M\"]\n[\"M\", \"M\", \"M\", \"C\"] ==> [\"C\", \"C\"]\n[\"M\", \"M\", \"M\"] <== [\"C\", \"C\", \"C\"]\n[\"C\", \"M\", \"M\", \"M\", \"C\"] ==> [\"C\"]\n[\"C\", \"M\", \"M\", \"M\"] <== [\"C\", \"C\"]\n[\"C\", \"C\", \"C\", \"M\", \"M\", \"M\"] ==> []\n")
    }
    
    func testMeasure() {
        self.measure {
            let _ = Engine(initialState: State(rightSide: ["C","C","C","M", "M","M"],
                                                      leftSide: [],
                                                      direction: State.Direction.rightToLeft)).run()
        }
    }
}
