//
//  IntersectionOfTwoArrayII.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/25/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class IntersectionOfTwoArrayII {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let sortedNums1 = nums1.sorted()
        let sortedNums2 = nums2.sorted()
        
        var idx1 = 0
        var idx2 = 0
        
        var rst: [Int] = []
        while idx1 < nums1.count && idx2 < nums2.count {
            if sortedNums1[idx1] == sortedNums2[idx2] {
                rst.append(sortedNums1[idx1])
                idx1 += 1
                idx2 += 1
            } else if sortedNums1[idx1] < sortedNums2[idx2] {
                idx1 += 1
            } else {
                idx2 += 1
            }
        }
        return rst
    }
}
