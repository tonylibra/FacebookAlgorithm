//
//  FindAllAnagramsInAString.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/24/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class FindAllAnagramsInAString {
//    func findAnagrams(_ s: String, _ p: String) -> [Int] {
//        let sLen = s.characters.count
//        let pLen = p.characters.count
//        guard sLen >= pLen else { return [] }
//        
//        let standard = p.characters.sorted()
//        var rst: [Int] = []
//        for i in 0..<(sLen-pLen + 1) {
//            let substring = s.substring(from: i, with: pLen).characters.sorted()
//            if substring == standard {
//                rst.append(i)
//            }
//        }
//        return rst
//    }
    
    //better solution
    
    func findAnagramsII(_ s: String, _ p: String) -> [Int] {
        guard p.characters.count <= s.characters.count else { return [] }
        let sLen = s.characters.count
        let pLen = p.characters.count
        var rst: [Int] = []
        var dict: [String: Int] = [:]
        for i in 0..<pLen {
            if let cnt = dict[p[i]] {
                dict[p[i]] = cnt + 1
            } else {
                dict[p[i]] = 1
            }
        }
        var count = pLen
        var left = 0, right = 0
        while right < sLen {
            let letter = s[right]
            if let num = dict[letter] {
                if num > 0 {
                    count -= 1
                }
                dict[letter] = num - 1
            }
            right += 1
            if count == 0 {
                rst.append(left)
            }
            if right - left == pLen{ //note: not right - left + 1 since right is added 1 in last if
                let leftLetter = s[left]
                if let num = dict[leftLetter] {
                    if num >= 0 {
                        count += 1
                    }
                    dict[leftLetter] = num + 1
                }
                left += 1
            }
        }
        return rst
    }
}
