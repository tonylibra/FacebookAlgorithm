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
            if knows(left, right) {
                left += 1
            } else {
                right -= 1
            }
        }
        
        for i in 0..<n {
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
