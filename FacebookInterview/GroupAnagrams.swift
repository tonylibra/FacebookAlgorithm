//
//  GroupAnagrams.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class GroupAnagrams {
    
    //use map
    //sorted string as key
    //str as value
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        
        for str in strs {
            let key = String(str.characters.sorted())
            if let _ = map[key] {
                map[key]?.append(str)
            } else {
                map[key] = [str]
            }
        }
        var rst: [[String]] = []
        for (_, val) in map {
            rst.append(val)
        }
        return rst
    }
}
