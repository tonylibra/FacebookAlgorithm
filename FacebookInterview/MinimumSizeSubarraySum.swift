//
//  MinimumSizeSubarraySum.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MinumumSizeSubarraySum {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var left = 0
        var right = 0
        
        var sum = 0
        var minLen = Int.max
        
        while right < nums.count {
            if sum < s {
                sum += nums[right]
                right += 1
            } else {
                minLen = min(minLen, right - left)
                sum -= nums[left]
                left += 1
            }
        }
        
        while sum >= s {
            minLen = min(minLen, right - left)
            sum -= nums[left]
            left += 1
        }
        return minLen == Int.max ? 0 : minLen
    }
}
