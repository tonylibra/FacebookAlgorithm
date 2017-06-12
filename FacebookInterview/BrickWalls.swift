//
//  BrickWalls.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class BrickWalls {
    func leastBricks(_ wall: [[Int]]) -> Int {
        guard wall.count > 0 else { return 0 }
        var map: [Int: Int] = [:]
        var maxCommonSum = 0
        for i in 0..<wall.count {
            let bricks = accumalateLen(wall[i])
            for b in bricks {
                if let _ = map[b] {
                    map[b]! += 1
                } else {
                    map[b] = 1
                }
                maxCommonSum = max(maxCommonSum, map[b]!)
            }
        }
        return wall.count - maxCommonSum
    }
    
    func accumalateLen(_ bricks: [Int]) -> [Int] {
        guard bricks.count > 0 else { return [] }
        var rst: [Int] = []
        var sum = 0
        for brick in bricks {
            sum += brick
            rst.append(sum)
        }
        rst.removeLast()
        return rst
    }
}
