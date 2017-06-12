//
//  WordBreak.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/22/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class WordBreak {
    
    //record the last index has word break
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        guard s.characters.count > 0 else { return false }
        var prevPositions: [Int] = []
        prevPositions.append(0) //first break is 0
        
        for i in 1...s.characters.count {
            for j in prevPositions {
                let seg = s.substring(from: j, to: i) //get the substring from previous index which is word break
                if wordDict.contains(seg) {
                    prevPositions.append(i)
                    break
                }
            }
        }
        return prevPositions.contains(s.characters.count)
    }
}
