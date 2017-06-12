//
//  HIndexII.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/6/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//the array have to be sorted. if calculate the hindex with unsorted array, sort it first
class HindexII {
    func HIndex(_ citation: [Int]) -> Int {
        var hIndx: Int = 0
        let len = citation.count
        
        for (i, v) in citation.enumerated() {
            let smallest = min(len - i, v)
            hIndx = max(hIndx, smallest)
        }
        return hIndx
    }
}
