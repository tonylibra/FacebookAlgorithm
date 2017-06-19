//
//  Subsets.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/7/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class Subsets {
    //just very backtracking
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [] }
        var rst: [[Int]] = []
        var item: [Int] = []
        
        helper(nums, &rst, &item, 0)
        return rst
    }
    
    func helper(_ nums: [Int], _ rst: inout [[Int]], _ item: inout [Int], _ pos: Int) {
        rst.append(item)
        
        for i in pos..<nums.count {
            item.append(nums[i])
            helper(nums, &rst, &item, i+1)
            item.removeLast()
        }
    }
    
    //华丽的分割线 II
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else { return [] }
        var rst: [[Int]] = []
        var item: [Int] = []
        let sortedNums = nums.sorted()
        helper(sortedNums, &rst, &item, 0)
        return rst
    }
    
    func helperDup(_ nums: [Int], _ rst: inout [[Int]], _ item: inout [Int], _ pos: Int) {
        rst.append(item)
        
        for i in pos..<nums.count {
            if i > pos && nums[i] == nums[i - 1] {
                continue
            }
            item.append(nums[i])
            helper(nums, &rst, &item, i + 1)
            item.removeLast()
        }
    }
}
