//
//  Helpers.swift
//  CP3MidiHelpers
//
//  Created by Corné on 11/06/2020.
//  Copyright © 2020 cp3.io. All rights reserved.
//

import Foundation

public func bjorklund(steps: Int, pulses: Int) -> [Bool] {
    
    var pattern = [Bool]()
    var counts = [Int]()
    var remainders = [pulses]
    var divisor = steps - pulses
    var level = 0
    
    while true {
        counts.append(divisor / remainders[level])
        remainders.append(divisor % remainders[level])
        divisor = remainders[level]
        level += 1
        
        if remainders[level] <= 1 {
            break
        }
    }
    
    counts.append(divisor)
    
    func build(_ level: Int) {
        
        if level > -1 {
            for _ in 0..<Int(counts[level]) {
                build(level - 1)
            }
            
            if remainders[level] != 0 {
                build(level - 2)
            }
            
        } else if level == -1 {
            pattern.append(false)
        } else if level == -2 {
            pattern.append(true)
        }
    }
    
    build(level)
    
    return pattern
}
