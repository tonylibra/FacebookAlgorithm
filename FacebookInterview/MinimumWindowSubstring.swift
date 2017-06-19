//
//  MinimumWindowSubstring.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/13/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MinimumWindowSubstring {
    func minWindow(_ s: String, _ t: String) -> String {
        let sLen = s.characters.count
        let tLen = t.characters.count
        guard sLen >= tLen else { return "" }
        
        var dic: [String: Int] = [:]
        var left = 0
        var right = 0
        
        for i in 0..<tLen { //save a copy to origin dict
            if let num = dic[t[i]] {
                dic[t[i]] = num + 1
            } else {
                dic[t[i]] = 1
            }
        }
        
        var count = 0 // effect count
        var map: [String: Int] = [:] //make a new dic to reocrd current situation
        var rst = ""
        var minLen = sLen + 1
        while right < s.characters.count {
            let letter = s[right]
            if let targetNum = dic[letter] { //if dic have it, means that this letter is in the t
                if let num = map[letter] { // if this letter happens in s before
                    if num < targetNum { //if appearance num in s smaller than t, add count
                        count += 1
                    }
                    map[letter] = num + 1
                } else {
                    map[letter] = 1
                    count += 1
                }
            }
            
            if count == tLen { //mean that current substring contains t
                var l = s[left]
                while map[l] == nil || map[l]! > dic[l]! {
                    if let num = map[l], num > dic[l]! {
                        map[l] = num - 1
                    }
                    left += 1
                    l = s[left]
                }
                
                if right - left + 1 < minLen {
                    rst = s.substring(from: left, to: right + 1)
                    minLen = right - left + 1
                }
            }
            
            right += 1
        }
        return rst
    }
}
