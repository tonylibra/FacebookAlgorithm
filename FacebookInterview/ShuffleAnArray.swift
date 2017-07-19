//
//  ShuffleAnArray.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/23/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//fisher yates shuffle algorithm, time complexity: O(n)
class ShuffleAnArray {
    var nums: [Int]
    var shuffled: [Int]
    init(_ nums: [Int]) {
        self.nums = nums
        self.shuffled = nums
    }
    
    func reset() -> [Int] {
        self.shuffled = self.nums
        return self.shuffled
    }
    
    func shuffle() -> [Int] {
        let len = self.shuffled.count
        
        for i in 0..<len {
            let idx = Int(arc4random_uniform(UInt32(len - i))) //generate a num from 0...n-1
            let tmp = shuffled[i]
            shuffled[i] = shuffled[i + idx]
            shuffled[i + idx] = tmp
        }
        return shuffled
    }
}
