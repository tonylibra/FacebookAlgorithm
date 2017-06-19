//
//  FindtheCelebrity.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation


class FindTheCelebrity {
    func findCelebrity(_ n: Int) -> Int {
        var left = 0
        var right = n - 1
        while left < right {
            if knows(left, right) { // left knows right
                left += 1
            } else { //left does knows right. But it doesnt mean whether right know left
                right -= 1
            }
        }
        
        for i in 0..<n { // sepcial case, in the room, everyone does not know each
            guard i != left else { continue }
            if knows(left, i) || !knows(i, left) {
                return -1
            }
        
        }
        return left
    }
    
    func knows(_ a: Int, _ b: Int) -> Bool {
        return false
    }
}
