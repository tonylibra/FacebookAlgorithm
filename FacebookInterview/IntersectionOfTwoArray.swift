//
//  IntersectionOfTwoArray.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/25/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class IntersectionOfTwoArray {
    //just use system function
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        let nums1Set: Set<Int> = Set(nums1)
        let nums2Set: Set<Int> = Set(nums2)
        return Array(nums1Set.intersection(nums2Set)) //O1
    }
    
    //use two pointer, need to sort it first
    func intersectionII(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var idx1 = 0
        var idx2 = 0
        
        let sortedNums1 = nums1.sorted()
        let sortedNums2 = nums2.sorted()
        
        var rst: [Int] = []
        while idx1 < sortedNums1.count && idx2 < sortedNums2.count {
            if sortedNums1[idx1] == sortedNums2[idx2] {
                if rst.isEmpty || rst.last! != sortedNums1[idx1] {
                    rst.append(sortedNums1[idx1])
                }
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
