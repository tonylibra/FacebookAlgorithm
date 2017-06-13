//
//  WallsAndGates.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/12/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class WallsAndGates {
    func wallsAndGates(_ rooms: inout [[Int]]) {
        guard let cols = rooms.first?.count, cols > 0 else { return }
        let rows = rooms.count
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: cols), count: rows)
        for i in 0..<rows {
            for j in 0..<cols {
                if rooms[i][j] == 0 {
                    for k in 0..<4 {
                        stepsHelper(&rooms, i + dirX[k], j + dirY[k], 1, &visited)
                    }
                }
            }
        }
    }
    
    let dirX = [0, 0, 1, -1]
    let dirY = [1, -1, 0, 0]
    func stepsHelper(_ rooms: inout [[Int]], _ i: Int, _ j: Int, _ distance: Int, _ visited: inout [[Bool]]) {
        if !inBound(rooms, i, j) || rooms[i][j] <= 0 || visited[i][j] {
            return
        }
        
        visited[i][j] = true
        rooms[i][j] = min(distance, rooms[i][j])
        for k in 0..<4 {
            stepsHelper(&rooms, i + dirX[k], j + dirY[k], distance + 1, &visited)
        }
        visited[i][j] = false
    }
    
    func inBound(_ rooms: [[Int]], _ i: Int, _ j: Int) -> Bool {
        guard let cols = rooms.first?.count, cols > 0 else { return false }
        let rows = rooms.count
        
        if i < 0 || i >= rows || j < 0 || j >= cols {
            return false
        }
        return true
    }
}
