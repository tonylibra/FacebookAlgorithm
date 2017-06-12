//
//  TotalHammingDistance.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/8/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TotalHammingDistance {
    func totalHammingDistance(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return 0 }
        var sum = 0
        for i in 0..<(nums.count-1) {
            for j in (i+1)..<nums.count {
                sum += hammingDistance(nums[i], nums[j])
            }
        }
        return sum
    }
    
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var rst = x ^ y
        var cnt = 0
        while rst != 0 {
            cnt += (rst & 1)
            rst = rst >> 1
        }
        return cnt
    }
}
