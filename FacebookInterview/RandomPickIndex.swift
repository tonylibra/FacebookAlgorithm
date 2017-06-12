//
//  Random Pick Index.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/26/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class RandomPickIndex {
    var nums: [Int]
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func picker(_ val: Int) -> Int { //return Index
        var cnt = 0
        var rst: Int = -1
        
        for i in 0..<nums.count {
            guard nums[i] == val else { continue }
            
            cnt += 1
            if Int(arc4random()) % cnt == 0 {
                rst = i
            }
        }
        return rst
    }
}
