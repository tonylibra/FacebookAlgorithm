//
//  MergeSortedArray.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MergeSortedArray {
    //since nums1 is long enough, just compare and merge to end to start
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var len = m + n - 1
        var i = m - 1
        var j = n - 1
        
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[len] = nums1[i]
                i -= 1
            } else {
                nums1[len] = nums2[j]
                j -= 1
            }
            len -= 1
        }
        
        while i >= 0 {
            nums1[len] = nums1[i]
            i -= 1
            len -= 1
        }
        while j >= 0 {
            nums1[len] = nums2[j]
            j -= 1
            len -= 1
        }
    }
}
