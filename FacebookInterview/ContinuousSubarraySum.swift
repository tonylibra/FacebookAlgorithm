//
//  ContinuousSubarraySum.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/8/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//two cases need take care
//1.  sum has to be at least 2 nums, so use pre to solve this
//2. k can be 0, if k is zero, we always make remaning as sum, when sum is 0, we can say it is n times of k
class ContinuousSubarraySum {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var pre: Int = 0
        var f: [Int] = []
        var sum = 0
        for num in nums {
            sum += num
            let remainder = (k == 0 ? sum : sum % k) //!!!!!!!!!!!!!!!!
            if f.contains(remainder) {
                return true
            }
            f.append(pre) //!!!!!!!!!!!!!!!
            pre = remainder
        }
        
        return false
    }
}
