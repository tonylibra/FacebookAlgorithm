//
//  InsertDeleteGetRandom.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/26/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation


class InsertDeleteGetRandom {
    var map1: [Int: Int] //val - index
    var map2: [Int: Int] //index - val
    init() {
        map1 = [:]
        map2 = [:]
    }
    func insert(_ val: Int) -> Bool {
        if let _ = map1[val] {
            return false
        } else {
            let idx = map1.count
            map1[val] = idx
            map2[idx] = val
        }
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let idx = map1[val] else { return false}
        
        map1.removeValue(forKey: val)
        map2.removeValue(forKey: idx)
        
        if map1.count == 0 {
            return true
        }
        
        if idx == map1.count {
            return true
        }
        
        //if removed val is not the last one
        let lastIdx = map1.count
        let lastVal = map2[lastIdx]!
        
        map1[lastVal] = idx
        map2.removeValue(forKey: lastIdx)
        map2[idx] = lastVal
        
        return true
    }
    
    func getRandom() -> Int {
        guard map1.count > 0 else { return -1 }
        let randomIndex = Int(arc4random_uniform(UInt32(map1.count)))
        return map2[randomIndex]!
    }
}
