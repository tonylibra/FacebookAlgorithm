//
//  Sort Colors.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/7/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class SortColors {
    //three pointers, start, end, and anther go through. start track 0, end track 2
    func sortColors(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        var pointer = 0
        
        while pointer <= right {
            if nums[pointer] == 0 {
                swap(&nums, left, pointer)
                left += 1
                pointer += 1
            } else if nums[pointer] == 1 {
                pointer += 1
            } else {
                swap(&nums, pointer, right)
                right -= 1
            }
        }
    }
    
    func swap(_ nums: inout [Int], _ i: Int, _ j: Int) {
        let tmp = nums[i]
        nums[i] = nums[j]
        nums[j] = tmp
    }
}
