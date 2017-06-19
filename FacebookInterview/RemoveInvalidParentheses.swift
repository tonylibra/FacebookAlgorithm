//
//  RemoveInvalidParentheses.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/13/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//class RemoveInvalidParentheses {
//    func removeInvalidParentheses(_ s: String) -> [String] {
//        guard s.characters.count > 0 else { return [""] }
//        
//        var rst: [String] = []
//        helper(s, "", 0, 0, &rst)
//        return rst.count == 0 ? [""] : rst
//    }
//    
//    var max: Int = 0
//    func helper(_ remainStr: String, _ newStr: String, _ leftCnt: Int, _ maxLen: Int, _ rst: inout [String]) {
//        if remainStr.characters.count == 0 {
//            if leftCnt == 0 && newStr.characters.count != 0 {
//                if maxLen > max {
//                    max = maxLen
//                }
//                
//                if max == maxLen && !rst.contains(newStr) {
//                    rst.append(newStr)
//                }
//            }
//            return
//        }
//        
//        if remainStr[0] == "(" {
//            helper(remainStr.substring(from: 1), newStr + "(", leftCnt + 1, maxLen + 1, &rst) // keep current (
//            helper(remainStr.substring(from: 1), newStr, leftCnt, maxLen, &rst) //discard current (
//        } else if remainStr[0] == ")" {
//            if leftCnt > 0 {
//                helper(remainStr.substring(from: 1), newStr + ")", leftCnt - 1, maxLen, &rst)
//            }
//            helper(remainStr.substring(from: 1), newStr, leftCnt, maxLen, &rst)
//        } else {
//            helper(remainStr.substring(from: 1), newStr + remainStr[0], leftCnt, maxLen, &rst)
//        }
//    }
//}
