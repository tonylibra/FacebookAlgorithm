//
//  PaintHouse.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/7/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class PaintHouse {
    //1. current minimum cost should be current cost + last line's minimum cost.
    //If the current idx is same as lastLineMin Cost, current min cost is current
    //cost with last line second min code
    func minCostII(_ costs: [[Int]]) -> Int {
        guard let cols = costs.first?.count else { return 0 }
        let rows = costs.count
        
        var lastMin = 0
        var lastSecondMin = 0
        var lastMinIdx = -1
        
        for i in 0..<rows {
            var curtMin = Int.max
            var curtSecondMin = Int.max
            var curtMinIdx = -1
            for j in 0..<cols {
                let curtSum = (j == lastMinIdx ? lastSecondMin : lastMin) + costs[i][j]
                if curtSum < curtMin {
                    curtSecondMin = curtMin
                    curtMin = curtSum
                    curtMinIdx = j
                } else if curtSum < curtSecondMin {
                    curtSecondMin = curtSum
                }
            }
            
            lastMin = curtMin
            lastSecondMin = curtSecondMin
            lastMinIdx = curtMinIdx
        }
        return lastMin
    }
}
