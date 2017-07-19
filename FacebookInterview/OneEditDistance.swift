//
//  OneEditDistance.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/12/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class OneEditDistance {
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        let len1 = s.characters.count
        let len2 = t.characters.count
        
        guard abs(len1 - len2) < 2 else { return false }
        
        var loc1 = 0
        var loc2 = 0
        var distance = 0
        while loc1 < len1 && loc2 < len2 {
            if s[loc1] == t[loc2] {
                loc1 += 1
                loc2 += 1
            } else {
                if distance > 0 {
                    return false
                }
                distance += 1
                if len1 > len2 {
                    loc1 += 1
                } else if len1 < len2 {
                    loc2 += 1
                } else {
                    loc1 += 1
                    loc2 += 1
                }
            }
        }
        
        while loc1 < len1 || loc2 < len2 {
            distance += 1
            loc1 += 1
            loc2 += 1
        }
        
        return distance == 1
    }
}
