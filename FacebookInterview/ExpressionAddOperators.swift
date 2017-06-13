//
//  ExpressionAddOperators.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/12/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class ExpressionAddOperators {
    func addOperators(_ num: String, _ target: Int) -> [String] {
        guard num.characters.count > 0 else { return [] }
        var rst: [String] = []
        addOperatorsHelper(num, target, 0, 0, "", &rst)
        return rst
    }
    
    func addOperatorsHelper(_ num: String, _ target: Int, _ sum: Int, _ pre: Int, _ item: String, _ rst: inout [String]) {
        if num == "" && target == sum { //when remainning num is empty, && sum == target, we have a valid ite,
            rst.append(item)
            return
        }
        guard num.characters.count > 0 else { return } //have to make sure the num is not emoty
        
        for i in 1...num.characters.count {
            let valueStr = num.substring(from: 0, to: i) //get current value
            
            if valueStr.characters.count > 1 && valueStr[0] == "0" { return } //!!!! this is important, we cannot have num like this "05", but we can have "0" as num
            
            guard let value = Int(valueStr) else { return }
            let remain = num.substring(from: i)
            if item.characters.count != 0 {
                addOperatorsHelper(remain, target, sum + value, value, item + "+\(value)", &rst)
                addOperatorsHelper(remain, target, sum - value, -value, item + "-\(value)", &rst)
                addOperatorsHelper(remain, target, (sum - pre)  + pre * value, pre * value, item + "*\(value)", &rst) //this is important. if operator is multiply, the prev num have to work with "*"
            } else {
                addOperatorsHelper(remain, target, value, value, String(value), &rst) //if item is ""
            }
        }
    }
}
