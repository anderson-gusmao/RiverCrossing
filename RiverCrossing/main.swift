//
//  main.swift
//  RiverCrossing
//
//  Created by Anderson Santos Gusmão on 03/03/19.
//  Copyright © 2019 Anderson Santos Gusmão. All rights reserved.
//


let solution = Engine(initialState: State(rightSide: ["C","C","C","M", "M","M"],
                           leftSide: [],
                           direction: State.Direction.rightToLeft)).run()
print(solution)

