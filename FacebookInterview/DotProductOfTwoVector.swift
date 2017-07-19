//
//  DotProductOfTwoVector.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/22/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class DotProductOfTwoVector {
    //O(m + n)
    func product(vector1: [Int], vector2: [Int]) -> Int {
        var v1: [(Int, Int)] = []
        var v2: [(Int, Int)] = []
        
        for v in vector1.enumerated() {
            guard v.element != 0 else { continue }
            v1.append(v)
        }
        for v in vector2.enumerated() {
            guard v.element != 0 else { continue }
            v2.append(v)
        }
        
        var i = 0
        var j = 0
        var sum = 0
        while i < v1.count && j < v2.count {
            let idx1 = v1[i].0
            let idx2 = v2[j].0
            
            if idx1 == idx2 {
                sum += v1[i].1 * v2[j].1
                i += 1
                j += 1
            } else if idx1 < idx2 {
                i += 1
            } else {
                j += 1
            }
        }
        return sum
    }
    
    //O(mlgn), binary search idx1 in v2, if find it, add product to sum, else go next
    
}
