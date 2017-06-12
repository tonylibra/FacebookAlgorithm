//
//  KthLargestElementInAnArray.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//1. partition, find the pivot
//2. compare pivot indx with k, then recursive
class KthLargestElementInAnArray {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k else { return -1 }
        var nutableNums = nums
        return findHelper(&nutableNums, k, 0, nums.count - 1)
    }
    
    func findHelper(_ nums: inout [Int], _ k: Int, _ left: Int, _ right: Int) -> Int  {
        if left == right {
            return nums[left]
        }
        let pIdx = partition(&nums, left, right)
        if (pIdx + 1) == k {
            return nums[pIdx]
        } else if (pIdx + 1) < k {
            return findHelper(&nums, k, pIdx + 1, right)
        } else {
            return findHelper(&nums, k, left, pIdx - 1)
        }
    }
    
    func partition(_ nums: inout [Int], _ l: Int, _ r: Int) -> Int {
        let p = nums[l]
        var left = l
        var right = r
        
        while left < right {
            while left < right && nums[right] <= p {
                right -= 1
            }
            nums[left] = nums[right]
            while left < right && nums[left] > p {
                left += 1
            }
            nums[right] = nums[left]
        }
        nums[left] = p
        return left
    }
}
