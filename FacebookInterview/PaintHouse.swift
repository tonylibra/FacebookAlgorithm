//
//  PaintHouse.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/7/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class PaintHouse {
    func minCostII(_ costs: [[Int]]) -> Int {
        guard let cols = costs.first?.count, cols > 0 else { return 0 }
        let rows = costs.count
        
        var lastIdx = 0
        var lastMin = 0
        var lastSec = 0
        for i in 0..<rows {
            var curtMin = Int.max
            var curtSec = Int.max
            var curtIdx = 0
            for j in 0..<cols {
                let sum = costs[i][j] + (j == lastIdx ? lastSec : lastMin)
                if sum < curtMin {
                    curtSec = curtMin
                    curtMin = sum
                    curtIdx = j
                } else if sum < curtSec {
                    curtSec = sum
                }
            }
            lastSec = curtSec
            lastMin = curtMin
            lastIdx = curtIdx
        }
        return lastMin
    }
}
