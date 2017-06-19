//
//  LongestConsecutiveSequence.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/13/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class LongestConsecutiveSequence {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var numsSet: Set<Int> = Set(nums)
        var maxLen = 0
        for num in nums {
            var left = num - 1
            while numsSet.contains(left) {
                numsSet.remove(num)
                left -= 1
            }
            var right = num + 1
            while numsSet.contains(right) {
                numsSet.remove(right)
                right += 1
            }
            maxLen = max(maxLen, right - left - 1)
        }
        return maxLen
    }
}
