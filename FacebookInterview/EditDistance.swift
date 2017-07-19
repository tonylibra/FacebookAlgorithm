//
//  EditDistance.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/25/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation


class EditDistance {
    func editDistance(_ s: String, _ t: String) -> Int {
        let len1 = s.characters.count //rows
        let len2 = s.characters.count //cols
        guard len1 > 0 && len2 > 0 else { return 0 }
        
        var f: [[Int]] = Array(repeating: Array(repeating: 0, count: len2 + 1), count: len1 + 1)
        for i in 1..<len1 {
            f[i][0] = i
        }
        for i in 1..<len2 {
            f[0][i] = i
        }
        
        for i in 1..<len1 {
            for j in 1..<len2 {
                if s[i-1] != t[j-1] { //remember s[i-1] == t[j-1]
                    f[i][j] = min(f[i-1][j-1], f[i-1][j], f[i][j-1]) + 1
                } else {
                    f[i][j] = f[i-1][j-1]
                }
            }
        }
        return f[len1][len2]
    }
}
