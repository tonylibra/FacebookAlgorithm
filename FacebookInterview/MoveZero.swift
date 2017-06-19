//
//  MoveZero.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MoveZero {
    func moveZeroes(_ nums: inout [Int]) {
        var left = 0
        var pointer = 0
        
        while pointer < nums.count {
            if nums[pointer] == 0 {
                pointer += 1
            } else {
                swap(&nums, left, pointer)
                left += 1
                pointer += 1
            }
        }
    }
    
    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        let tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
}
