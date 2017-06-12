//
//  RemoveDuplicatesfromSortedArray.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/7/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class RemoveDuplicatesfromSortedArray {
    
    //II can keep maximum two dup
    //
    func II(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else { return nums.count }
        
        var left = 0
        var pointer = 1
        var cnt = 1
        
        while pointer < nums.count {
            if nums[pointer] != nums[left] {
                left += 1
                nums[left] = nums[pointer]
                cnt = 1
            } else {
                guard cnt < 2 else {
                    pointer += 1
                    continue
                }
                left += 1
                nums[left] = nums[pointer]
                cnt += 1
            }
            pointer += 1
        }
        
        return left + 1
    }
}
