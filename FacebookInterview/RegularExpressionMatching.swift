//
//  RegularExpressionMatching.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/7/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class RegularExpressionMatching {
    func isMatch(_ s: String, _ p: String) -> Bool {
        if p.characters.count == 0 {
            return s.characters.count == 0
        }
        
        if p.characters.count == 1 || p[1] != "*" {
            if s.characters.count < 1 || (p[0] != "." && s[0] != p[0]) {
                return false
            }
            return isMatch(s.substring(from: 1), p.substring(from: 1))
        } else {
            let len = s.characters.count
            var i = -1
            while i < len && (i < 0 || p[0] == "." || p[0] == s[0]) {
                if isMatch(s.substring(from: i + 1), p.substring(from: 2)) {
                    return true
                }
                i += 1
            }
            return false
        }
    }
}

//if second character of p is not *
//so s[0] == p[0] or s[0] == "."
// we can recursive to s.substring(from: 1), p.substring(from: 1)

//if second character of p is *
//we compare s.substring(from: i), i means we loop i from 0, to compare with p.substring(from: 2), means after "*"
