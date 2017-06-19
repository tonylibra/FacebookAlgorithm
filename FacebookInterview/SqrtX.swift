//
//  SqrtX.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class SqrtX {
    func mySqrt(_ x: Int) -> Int {
        guard x > 1 else { return x }
        var left = 1
        var right = x
        
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if mid * mid == x {
                return mid
            } else if mid * mid < x {
                left = mid
            } else {
                right = mid
            }
        }
        
        if right * right == x {
            return right
        }
        return left
    }
}
