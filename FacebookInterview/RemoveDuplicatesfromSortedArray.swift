//
//  RemoveDuplicatesfromSortedArray.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/7/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class RemoveDuplicatesfromSortedArray {
    //I
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 0 else { return 0 }
        var len = 0
        var pointer = 0
        
        while pointer < nums.count {
            if nums[pointer] != nums[len] {
                len += 1
                nums[len] = nums[pointer]
            }
            pointer += 1
        }
        return len + 1
    }
    
    //II can keep maximum two dup
    func removeDuplicatesII(_ nums: inout [Int]) -> Int {
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
                if cnt < 2 {
                    left += 1
                    nums[left] = nums[pointer]
                    cnt += 1
                }
            }
            pointer += 1
        }
        
        return left + 1
    }
}
