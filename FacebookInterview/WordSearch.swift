//
//  WordSearch.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class WordSearch {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard let cols = board.first?.count, cols > 0 else { return false }
        let rows = board.count
        var mutableBoard = board
        
        for i in 0..<rows {
            for j in 0..<cols {
                if mutableBoard[i][j] == word[char: i] {
                    if wordSearchHelper(&mutableBoard, word, i, j, 0) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    
    let dirX = [0, 0, 1, -1]
    let dirY = [1, -1, 0, 0]
    func wordSearchHelper(_ board: inout [[Character]], _ word: String, _ i: Int, _ j: Int, _ pos: Int) -> Bool {
        guard let cols = board.first?.count, cols > 0 else { return false }
        let rows = board.count
        if pos == word.characters.count {
            return true
        }
        
        if i < 0 || i >= rows || j < 0 || j >= cols || word[char: i] != board[i][j] {
            return false
        }
        
        board[i][j] = "#"
        let rst = wordSearchHelper(&board, word, i + dirX[0], j + dirY[0], pos + 1)
            || wordSearchHelper(&board, word, i + dirX[1], j + dirY[1], pos + 1)
            || wordSearchHelper(&board, word, i + dirX[2], j + dirY[2], pos + 1)
            || wordSearchHelper(&board, word, i + dirX[3], j + dirY[3], pos + 1)
        board[i][j] = word[char: i]
        return rst
    }
}


extension String {
    subscript(char i: Int) -> Character {
        let idx = self.index(startIndex, offsetBy: i)
        return self[idx]
    }
}
