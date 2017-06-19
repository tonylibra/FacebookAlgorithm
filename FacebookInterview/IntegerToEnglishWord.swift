//
//  IntegerToEnglishWord.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/15/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class IntegerToEnglishWord {
    let v = ["", "Thousand", "Million", "Billion"]
    let v1 = ["", "", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
    let v2 = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    func numberToWords(_ num: Int) -> String {
        guard num > 0 else { return "Zero" }
        var mutableNum = num
        var rstArr: [String] = []
        for i in 0..<v.count {
            var curtStr: [String] = []
            var curtNum = mutableNum % 1000
            mutableNum = mutableNum / 1000
            guard curtNum > 0 else { continue }
            if curtNum / 100 > 0 {
                curtStr.append("\(v2[curtNum / 100]) Hundred")
            }
            if curtNum % 100 > 0 {
                if curtNum % 100 < 20 {
                    curtStr.append("\(v2[curtNum % 100])")
                } else {
                    let tmpNum = curtNum % 100
                    if tmpNum / 10 != 0 {
                        curtStr.append("\(v1[tmpNum / 10])")
                    }
                    if tmpNum % 10 != 0 {
                        curtStr.append("\(v2[tmpNum % 10])")
                    }
                }
            }
            if i > 0 {
                curtStr.append(v[i])
            }
            rstArr.append(combine(curtStr))
        }
        
        return combine(rstArr.reversed())
    }
    
    func combine(_ arr: [String]) -> String {
        var rst = ""
        for j in 0..<arr.count {
            if j == arr.count - 1 {
                rst += arr[j]
            } else {
                rst += "\(arr[j]) "
            }
        }
        return rst
    }
}
