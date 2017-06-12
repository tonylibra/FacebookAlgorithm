//
//  MaximumSizeSubarraySumEqualsK.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation


//1. accamulate, and save the sum, idx pair to the map
//2. if there is sum - k exist in the map, update the maxLen
//3. one thing special: the first value, idx pair should be [0: -1]
class MaximumSizeSubarraySumEqualsK {
    func maxSubArrayLen(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        var map: [Int: Int] = [:]
        map[0] = -1
        var maxLen = 0
        
        for (idx, num) in nums.enumerated() {
            sum += num
            if let i = map[sum - k] {
                maxLen = max(maxLen, idx - i)
            }
            
            if map[sum] == nil {
                map[sum] = idx
            }
        }
        
        return maxLen
    }
}
