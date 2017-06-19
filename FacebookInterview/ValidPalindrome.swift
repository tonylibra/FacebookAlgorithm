//
//  ValidPalindrome.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class ValidPalindrome {
    //left and right pointer, if ==, move inside, if not, return
    func isPalindrome(_ s: String) -> Bool {
        guard s.characters.count > 0 else {
            return true
        }
        var left = 0
        var right = s.characters.count - 1
        
        while left < right {
            while left < right && !s[left].isAlphanumeric() {
                left += 1
            }
            while left < right && !s[right].isAlphanumeric() {
                right -= 1
            }
            if s[left].lowercased() == s[right].lowercased() {
                left += 1
                right -= 1
            } else {
                return false
            }
        }
        return true
    }
}

extension String {
    func isAlphanumeric() -> Bool {
        guard self.characters.count == 1 else {
            return false
        }
        
        if ("a" <= self && self <= "z") || ("A" <= self && self <= "Z") || ("0" <= self && self <= "9") {
            return true
        }
        return false
    }
}
