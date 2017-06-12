//
//  MaximalRectangle.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/7/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MaximalRectangle {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard let cols = matrix.first?.count, cols > 0 else { return 0 }
        let rows = matrix.count
        
        var heights = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows)
        for i in 0..<rows {
            for j in 0..<cols {
                if matrix[i][j] == "0" {
                    heights[i][j] = 0
                } else {
                    if i == 0 {
                        heights[i][j] = 1
                    } else {
                        heights[i][j] = heights[i-1][j] + 1
                    }
                }
            }
        }
        
        var maxArea = 0
        for i in 0..<rows {
            let heightRow = heights[i]
            maxArea = max(maxArea, getArea(heightRow))
        }
        return maxArea
    }
    
    func getArea(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        var maxArea: Int = 0
        var idx = 0
        while idx < heights.count {
            if let last = stack.last, heights[last] > heights[idx] {
                let lastIdx = stack.removeLast()
                if let last = stack.last {
                    maxArea = max(maxArea, heights[lastIdx] * (idx - last - 1))
                } else {
                    maxArea = max(maxArea, heights[lastIdx] * idx)
                }
            } else {
                stack.append(idx)
                idx += 1
            }
        }
        return maxArea
    }
}
