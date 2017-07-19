//
//  StrStr.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class StrStr {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.characters.count <= haystack.characters.count else {
            return -1
        }
        if needle == "" {
            return 0
        }
        
        for i in 0..<(haystack.characters.count - needle.characters.count + 1) {
            if needle[0] == haystack[i] {
                if haystack.substring(from: i, to: needle.characters.count) == needle {
                    return i
                }
            }
        }
        return -1
    }
}

//extension String {
//    subscript(i: Int) -> String {
//        let index = self.index(startIndex, offsetBy: i)
//        return String(self[index])
//    }
//    
//    func substring(from start: Int, with len: Int) -> String {
//        let startIdx = self.index(startIndex, offsetBy: start)
//        let endIdx = self.index(startIndex, offsetBy: start + len)
//        return self.substring(with: startIdx..<endIdx)
//    }
//}
