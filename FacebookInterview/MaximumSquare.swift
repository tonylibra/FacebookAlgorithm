//
//  MaximumSquare.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/12/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MaximumSquare {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard let cols = matrix.first?.count, cols > 0 else { return 0 }
        let rows = matrix.count
        var f: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        var maxLen = 0
        for i in 0..<rows {
            f[i][0] = matrix[i][0] == "1" ? 1 : 0
            maxLen = max(maxLen, f[i][0])
            for j in 1..<cols {
                if i == 0 {
                    f[i][j] = matrix[i][j] == "1" ? 1 : 0
                } else {
                    if matrix[i][j] == "0" {
                        f[i][j] = 0
                    } else {
                        f[i][j] = min(f[i-1][j-1], f[i-1][j], f[i][j-1]) + 1
                    }
                }
                maxLen = max(maxLen, f[i][j])
            }
        }
        return maxLen * maxLen
    }
}
