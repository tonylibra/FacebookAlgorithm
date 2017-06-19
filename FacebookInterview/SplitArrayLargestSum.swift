//
//  SplitArrayLargestSum.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/13/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class SplitArrayLargestSum {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        var left = 0
        var right = 0
        for num in nums {
            left = max(left, num)
            right += num
        }
        if m == 1 {
            return right
        }
        
        while left <= right {
            var mid = left + (right - left) / 2
            if isValid(nums, m, mid) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    func isValid(_ nums: [Int], _ m: Int, _ max: Int) -> Bool {
        var sum = 0
        var count = 1 //!!!!!!!!!!
        for num in nums {
            sum += num
            if sum > max {
                count += 1 //when sum > max, count + 1, reset the sum
                sum = num
            }
            if count > m {
                return false // means max is too small
            }
        }
        return true //means max is too big
    }
}
