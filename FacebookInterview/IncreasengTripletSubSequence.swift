//
//  IncreasengTripletSubSequence.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class IncreasengTripletSubSequence {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var x = Int.max
        var y = Int.max
        
        for num in nums {
            if num <= x {
                x = num
            } else if num <= y {
                y = num
            } else {
                return true
            }
        }
        return false
    }
}
