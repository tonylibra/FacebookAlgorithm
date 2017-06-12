//
//  RandomizedSet.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/28/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//use two map, one is [val: idx], one is [idx, val]
class RandomizedSet {
    var map1: [Int: Int] //[val: cnt]
    var map2: [Int: Int] //[cnt: val]
    init() {
        map1 = [:]
        map2 = [:]
    }
    
    func insert(_ val: Int) -> Bool {
        if map1.keys.contains(val) {
            return false
        }
        let size = map1.count
        map1[val] = size
        map2[size] = val
        return true
    }
    
    //if removed val's idx is not the last one, need update the current last [val: idx] pair to old idx position
    func remove(_ val: Int) -> Bool {
        guard let idx = map1[val] else { return false }
        map1.removeValue(forKey: val)
        map2.removeValue(forKey: idx)
        
        if map1.isEmpty {
            return true
        }
        if idx == map1.count {
            return true
        }
        
        let key = map2[map1.count]!
        map1[key] = idx
        map2.removeValue(forKey: map1.count)
        map2[idx] = key
        
        return true
    }
    
    func getRandom() -> Int {
        guard map1.count > 0 else { return -1 }
        let randomIdx = arc4random_uniform(UInt32(map1.count))
        return map2[Int(randomIdx)]!
    }
}
