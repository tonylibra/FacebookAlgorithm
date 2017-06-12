//
//  MyPow.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MyPow {
    func myPow(_ n: Int, _ x: Int) -> Int {
        if n == 0 {
            return 0
        }
        if x == 0 {
            return 1
        }
        
        if x < 0 {
            return 1 / myPow(n, -x)
        }
        
        var rst = myPow(n, x / 2)
        rst = rst * rst
        if x % 2 == 1 {
            rst = rst * x
        }
        return rst
    }
}
