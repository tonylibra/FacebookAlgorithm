//
//  WildMatching.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/15/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class WildMatching {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var i = 0, j = 0
        var iIndex = -1, startIndex = -1
        
        while i < s.characters.count {
            if j < p.characters.count && (p[j] == "?" || s[i] == p[j]) { //match, move pointer
                i += 1
                j += 1
            } else if j < p.characters.count && p[j] == "*" {
                startIndex = j
                iIndex = i
                j += 1 // "*" represent empty string here
            } else if startIndex != -1 { //s[i] != p[j], but there is "*" before j
                iIndex += 1
                i = iIndex
                j = startIndex + 1
            } else { //cannot match, return false
                return false
            }
        }
        while j < p.characters.count && p[j] == "*" {
            j += 1
        }
        return j == p.characters.count
    }
}

extension String {
    subscript(_ i: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: i)
        return String(self[index])
    }
}
