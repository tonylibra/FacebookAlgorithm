//
//  NumberOfIslands.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class NumberOfIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard let cols = grid.first?.count, cols > 0 else { return 0 }
        let rows = grid.count
        var count = 0
        var mutableGrid = grid
        for i in 0..<rows {
            for j in 0..<cols {
                if mutableGrid[i][j] == "1" {
                    count += 1
                    markIslands(&mutableGrid, i, j)
                }
            }
        }
        return count
    }
    
    let dirX = [0, 0, 1, -1]
    let dirY = [1, -1, 0, 0]
    func markIslands(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        if !inBound(grid, i, j) || grid[i][j] == "0" {
            return
        }
        
        grid[i][j] = "0"
        for k in 0..<4 {
            markIslands(&grid, i + dirX[k], j + dirY[k])
        }
    }
    
    func inBound(_ grid: [[Character]], _ i: Int, _ j: Int) -> Bool{
        guard let cols = grid.first?.count, cols > 0 else { return false }
        let rows = grid.count
        
        if i < 0 || i >= rows || j < 0 || j >= cols {
            return false
        }
        return true
    }
}
