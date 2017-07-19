//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/27/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class LongestSubstringWithoutRepeatingCharacters {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.characters.count > 0 else { return 0 }
        var set: Set<String> = []
        var lastPos = 0
        var maxLen = 0
        for i in 0..<s.characters.count {
            if !set.contains(s[i]) {
                set.insert(s[i])
            } else {
                maxLen = max(maxLen, set.count)
                for j in lastPos..<i {
                    if s[j] == s[i] {
                        lastPos = j + 1
                        break
                    }
                    set.remove(s[j])
                }
            }
        }
        maxLen = max(maxLen, set.count)
        return maxLen
    }
}
