//
//  RomanToInteger.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class RomanToInteger {
    let map: [String: Int] = ["I": 1,
                              "V": 5,
                              "X": 10,
                              "L": 50,
                              "C": 100,
                              "D": 500,
                              "M": 1000]
    func romanToInt(_ s: String) -> Int {
        guard s.characters.count > 0 else { return 0 }
        
        var sum = 0
        for i in 0..<s.characters.count-1 {
            if map[s[i]]! < map[s[i+1]]! {
                sum -= map[s[i]]!
            } else {
                sum += map[s[i]]!
            }
        }
        sum += map[s[s.characters.count-1]]!
        return sum
    }
}
