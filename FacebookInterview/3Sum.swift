//
//  3Sum.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//sort
//same as two sum, just need one more pointer
class ThreeSum {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        var sorted = nums.sorted()
        var rst: [[Int]] = []
        
        for p in 0..<sorted.count - 2 {
            if p != 0 && sorted[p-1] == sorted[p] {
                continue
            }
            var left = p + 1
            var right = sorted.count - 1
            
            while left < right {
                let sum = sorted[p] + sorted[left] + sorted[right]
                if sum == 0 {
                    rst.append([sorted[p], sorted[left], sorted[right]])
                    left += 1
                    right -= 1
                    
                    while left < right && sorted[left] == sorted[left - 1] {
                        left += 1
                    }
                    while left < right && sorted[right] == sorted[right + 1] {
                        right -= 1
                    }
                } else if sum < 0 {
                    left += 1
                } else {
                    right -= 1
                }
            }
        }
        return rst
    }
}
