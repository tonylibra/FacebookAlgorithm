//
//  CountAndSay.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class CountAndSay {
    func countAndSay(_ n: Int) -> String {
        var cnt = 1
        var cntAndSay: String = "1"
        for _ in 1..<n {
            var newNum = ""
            cnt = 1
            var pre = cntAndSay[0]
            for j in 1..<cntAndSay.characters.count {
                if cntAndSay[j] == pre {
                    cnt += 1
                } else {
                    newNum += "\(cnt)\(pre)"
                    pre = cntAndSay[j]
                    cnt = 1
                }
            }
            newNum += "\(cnt)\(pre)"
            cntAndSay = newNum
        }
        return cntAndSay
    }
}
