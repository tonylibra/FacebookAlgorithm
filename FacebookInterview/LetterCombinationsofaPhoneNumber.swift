//
//  LetterCombinationsofaPhoneNumber.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class LetterCombinationsofaPhoneNumber {
    let map = ["0": [],
               "1": [],
               "2": ["a", "b", "c"],
               "3": ["d", "e", "f"],
               "4": ["g", "h", "i"],
               "5": ["j", "k", "l"],
               "6": ["m", "n", "o"],
               "7": ["p", "q", "r", "s"],
               "8": ["t", "u", "v"],
               "9": ["w", "x", "y", "z"]]
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.characters.count > 0 else { return [] }
        
        var rst: [String] = []
        combinationHelper(digits, 0, &rst, "")
        return rst
    }
    
    func combinationHelper(_ digits: String, _ pos: Int, _ rst: inout [String], _ item: String) {
        if pos == digits.characters.count {
            rst.append(item)
            return
        }
        
        let num = digits[pos]
        guard let letters = map[num] else { return }
        for letter in letters {
            combinationHelper(digits, pos + 1, &rst, item + letter)
        }
    }
}
