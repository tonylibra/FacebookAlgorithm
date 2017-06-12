//
//  DecodeWays.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class DecodeWays {
    func numDecodings(_ s: String) -> Int {
        //f[i] = f[i-1] + f[i-2]
        guard s.characters.count > 0 else { return 0 }
        var f: [Int] = Array(repeating: 0, count: s.characters.count + 1)
        f[0] = 1
        f[1] = s[0] == "0" ? 0 : 1
        
        var i = 2
        while i <= s.characters.count {
            if s[i-1] != "0" {
                f[i] = f[i-1]
            }
            
            guard let num = Int(s[i-2] + s[i-1]) else { return 0 }
            if num >= 10 && num <= 26 {
                f[i] += f[i-2]
            }
            i += 1
        }
        return f[s.characters.count]
    }
}
