//
//  ContiguousArray.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/6/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class ContiguousArray {
    func findMaxLength(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        map[0] = -1
        var maxLen: Int = 0
        
        var sum = 0
        for (idx, val) in nums.enumerated() {
            if val == 0 {
                sum -= 1
            } else {
                sum += 1
            }
            if let i = map[sum] {
                maxLen = max(maxLen, idx - i)
            } else {
                map[sum] = idx
            }
        }
        return maxLen
    }
}
