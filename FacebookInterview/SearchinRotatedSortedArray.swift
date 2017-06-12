//
//  SearchinRotatedSortedArray.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class SearchinRotatedSortedArray {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return -1 }
        var left = 0
        var right = nums.count - 1
        
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] > nums[left] {
                if target >= nums[left] && nums[mid] > target {
                    right = mid
                } else {
                    left = mid
                }
            } else {
                if target <= nums[right] && nums[mid] < target {
                    left = mid
                } else {
                    right = mid
                }
            }
        }
        
        if nums[left] == target {
            return left
        }
        if nums[right] == target {
            return right
        }
        return -1
    }
}
