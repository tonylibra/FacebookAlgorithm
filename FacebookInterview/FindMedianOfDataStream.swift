//
//  FindMedianOfDataStream.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/3/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class Median {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        var sortedNums: [Int] = []
        for i in 0..<k {
            sortedNums.append(nums[i])
        }
        
        var medianNums: [Double] = []
        medianNums.append(medianNum(sortedNums.sorted(), k))
        for i in 1...(nums.count - k) {
            sortedNums.removeFirst()
            sortedNums.append(nums[i + k - 1])
            medianNums.append(medianNum(sortedNums.sorted(), k))
        }
        return medianNums
    }
    
    func medianNum(_ nums: [Int], _ k: Int) -> Double {
        if k % 2 == 0 {
            return (Double(nums[k / 2]) + Double(nums[k / 2 + 1]))  / 2.0
        } else {
            return Double(nums[k / 2])
        }
    }
}
