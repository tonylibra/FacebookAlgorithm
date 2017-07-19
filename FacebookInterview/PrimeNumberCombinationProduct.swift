//
//  PrimeNumberCombinationProduct.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/24/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation


//ask interviewer is there duplicate num in the nums

//1. sort the nums
//2. check duplicte
class PrimeNumberCombinationProduct {
    func product(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted() //sort to prevent duplicate
        var rst: [Int] = []
        productHelper(sortedNums, &rst, 1, 0)
        return rst
    }
    
    func productHelper(_ nums: [Int], _ rst: inout [Int], _ product: Int, _ idx: Int) {
        guard idx < nums.count else { return }
        if product != 1 {
            rst.append(product)
        }
        
        for i in idx..<nums.count {
            if i != idx && nums[i] == nums[i-1] {
                continue
            }
            productHelper(nums, &rst, product * nums[i], i + 1)
        }
    }
}
