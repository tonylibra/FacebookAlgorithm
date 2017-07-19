//
//  LongestIncreasingSubsequence.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/25/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class LongestInceasingSubsequence {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var minSeq: [Int] = Array(repeating: Int.max, count: nums.count)
        for num in nums {
            binarySearch(&minSeq, num)
        }
        
        var len = 0
        for num in minSeq {
            if num != Int.max {
                len += 1
            }
        }
        return len
    }
    
    func binarySearch(_ minSeq: inout [Int], _ target: Int) {
        var left = 0
        var right = minSeq.count - 1
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if minSeq[mid] == target {
                return
            } else if minSeq[mid] > target {
                right = mid
            } else {
                left = mid
            }
        }
        if minSeq[left] >= target {
            minSeq[left] = target
        } else {
            minSeq[right] = target
        }
    }
}
