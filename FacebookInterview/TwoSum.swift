//  TwoSum.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else { return [-1, -1] }
        
        var map: [Int: Int] = [:] // [num: idx]
        for i in 0..<nums.count {             if let idx = map[nums[i]] {
                return [idx, i]
            } else {
                map[target - nums[i]] = i
            }
        }
        return [-1, -1]
    }
}
