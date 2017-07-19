//
//  KNearestPointToOrigin.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/22/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class Pointer {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    var originDistance: Int {
        return Int(pow(Double(self.x), 2) + pow(Double(self.y), 2))
    }
}

//in swift there is no heap at all! shit!
public class KNearestPointToOrigin {
    func findKNearestPoint(_ k: Int, _ nums: [Pointer]) -> [Pointer] {
        guard nums.count >= k else { return [] }
        
        var array: [Pointer] = []
        for i in 0..<k {
            array.append(nums[i])
        }
        array.sort { (p1, p2) -> Bool in //this array looks like a maxHeap
            p1.originDistance > p2.originDistance
        }
        
        for i in k..<nums.count {
            updateArray(&array, with: nums[i])
        }
        
        return array
    }
    
    //I do this since I do not have a heap, maxHeap
    func updateArray(_ array: inout [Pointer], with p: Pointer) {
        guard p.originDistance < array[0].originDistance else { return }
        array.removeFirst()
        for (idx, val) in array.enumerated() {
            if val.originDistance < p.originDistance {
                array.insert(p, at: idx)
                return
            }
        }
        array.append(p)
    }
}








