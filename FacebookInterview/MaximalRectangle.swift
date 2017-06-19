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
        
        let heightMatrix = makeHeightMatrix(from: matrix)
        var maxArea = 0
        for i in 0..<heightMatrix.count {
            maxArea = max(maxArea, calculateMaxSize(with: heightMatrix[i]))
        }
        return maxArea
    }
    
    func makeHeightMatrix(from matrix: [[Character]]) -> [[Int]] {
        guard let cols = matrix.first?.count, cols > 0 else { return [[]] }
        let rows = matrix.count
        
        var heightMatrix = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows)
        for i in 0..<rows {
            for j in 0..<cols {
                if i == 0 {
                    heightMatrix[i][j] = matrix[i][j] == "0" ? 0 : 1
                } else {
                    heightMatrix[i][j] = matrix[i][j] == "0" ? 0 : heightMatrix[i-1][j] + 1
                }
            }
        }
        return heightMatrix
    }
    
    func calculateMaxSize(with heightArr: [Int]) -> Int {
        guard heightArr.count > 0 else { return 0 }
        var stack: [Int] = [] //!!!!!!!!!
        var maxArea = 0
        var idx = 0
        
        while idx < heightArr.count {
            if let last = stack.last, heightArr[last] > heightArr[idx] {
                let lastIdx = stack.removeLast()
                if let newLast = stack.last {
                    maxArea = max(maxArea, heightArr[lastIdx] * (idx - newLast - 1))
                } else {
                    maxArea = max(maxArea, heightArr[lastIdx] * idx)
                }
            } else {
                stack.append(idx)
                idx += 1
            }
        }
        return maxArea
    }
}
