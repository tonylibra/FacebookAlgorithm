//
//  HammingDistance.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class HammingDistance {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var distance = 0
        var rst = x ^ y
        while rst != 0 {
            distance += (rst & 1)
            rst >> 1
        }
        return distance
    }
}
