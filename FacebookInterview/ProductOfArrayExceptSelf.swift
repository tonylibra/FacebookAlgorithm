//
//  ProductOfArrayExceptSelf.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class ProductOfArrayExceptSelf {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 0 else { return [] }
        
        var prepNums = Array(repeating: 1, count: nums.count)
        for i in (0..<nums.count-1).reversed() {
            prepNums[i] = nums[i + 1] * prepNums[i+1]
        }
        
        var last = 1
        var rst: [Int] = []
        for i in 0..<nums.count {
            rst.append(last * prepNums[i])
            last = last * nums[i]
        }
        
        return rst
    }
}
