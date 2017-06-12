//
//  TargetSum.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TargetSum {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        var count = 0
        
        find(nums, S, 0, 0, &count)
        return count
    }
    
    func find(_ nums: [Int], _ S: Int, _ sum: Int, _ pos: Int, _ count: inout Int) {
        if pos == nums.count{
            if sum == S {
                count += 1
            }
            return
        }
        
        find(nums, S, sum + nums[pos], pos + 1, &count)
        find(nums, S, sum - nums[pos], pos + 1, &count)
    }
}
