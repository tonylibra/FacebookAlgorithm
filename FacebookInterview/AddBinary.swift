//
//  AddBinary.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class AddBinary {
    func addBinary(_ a: String, _ b: String) -> String {
        var rst = ""
        var posA = a.characters.count - 1
        var posB = b.characters.count - 1
        var c = 0
        
        while posA >= 0 || posB >= 0 {
            var numA = 0
            if posA >= 0 {
                numA = (a[posA] == "1" ? 1 : 0)
            }
            var numB = 0
            if posB >= 0 {
                numB = (b[posB] == "1" ? 1 : 0)
            }
            let sum = numA + numB + c
            rst += "\(sum % 2)"
            c = sum / 2
            posA -= 1
            posB -= 1
        }
        if c != 0 {
            rst += "\(c)"
        }
        
        return String(rst.characters.reversed())
    }
}
