//
//  MultiplyStrings.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation


class MultiplyStrings {
    func multiply(_ num1: String, _ num2: String) -> String {
        let len1 = num1.characters.count
        let len2 = num2.characters.count
        guard len1 > 0 && len2 > 0 else { return "0" }
        
        var productArr: [Int] = Array(repeating: 0, count: len1 + len2)
        
        for i in (0..<len1).reversed() {
            guard let a = Int(num1[i]) else { return "0" }
            for j in (0..<len2).reversed() {
                guard let b = Int(num2[j]) else { return "0" }
                let rst = a * b + productArr[i + j + 1]
                productArr[i + j + 1] = rst % 10
                productArr[i + j] += rst / 10
            }
        }
        
        var i = 0
        while i < productArr.count && productArr[i] == 0 {
            i += 1
        }
        var product = ""
        while i < productArr.count {
            product += "\(productArr[i])"
            i += 1
        }
        return product == "" ? "0" : product
    }
}
