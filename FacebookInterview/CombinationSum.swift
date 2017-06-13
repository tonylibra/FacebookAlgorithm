//
//  CombinationSum.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class CombinationSum {
    //I, the candidates does not have dup
    func combinationSumI(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 else { return [] }
        var rst: [[Int]] = []
        var item: [Int] = []
        
        let sortedCandiates = candidates.sorted()
        combinationIHelper(sortedCandiates, target, 0, &rst, &item)
        return rst
    }
    
    func combinationIHelper(_ candidates: [Int], _ target: Int, _ pos: Int, _ rst: inout [[Int]], _ item: inout [Int]) {
        if target == 0 {
            rst.append(item)
            return
        }
        
        for i in pos..<candidates.count {
            if target < candidates[i] {
                return
            }
            item.append(candidates[i])
            combinationIHelper(candidates, target - candidates[i], i, &rst, &item)
            item.removeLast()
        }
    }
    
    //II Candidates can have dup
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        guard candidates.count > 0 else { return [] }
        var rst: [[Int]] = []
        var item: [Int] = []
        
        let sortedCandiates = candidates.sorted()
        combination2Helper(sortedCandiates, target, 0, &rst, &item)
        return rst
    }
    
    func combination2Helper(_ candidates: [Int], _ target: Int, _ pos: Int, _ rst: inout [[Int]], _ item: inout [Int]) {
        if target == 0 {
            rst.append(item)
            return
        }
        
        for i in pos..<candidates.count {
            if i > pos && candidates[i] == candidates[i - 1] {
                continue
            }
            if target < candidates[i] {
                return
            }
            item.append(candidates[i])
            combination2Helper(candidates, target - candidates[i], i + 1, &rst, &item)
            item.removeLast()
        }
    }
    
    //III
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        guard k > 0 else { return [] }
        var rst: [[Int]] = []
        var item: [Int] = []
        
        combination3Helper(k, n, 1, &rst, &item)
        return rst
    }
    
    func combination3Helper(_ k: Int, _ target: Int, _ pos: Int, _ rst: inout [[Int]], _ item: inout [Int]) {
        if item.count == k {
            if target == 0 {
                rst.append(item)
            }
            return
        }
        
        for i in pos..<10 {
            if target < i {
                return
            }
            item.append(i)
            combination3Helper(k, target - i, i + 1, &rst, &item)
            item.removeLast()
        }
    }
    
    //IV
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else { return 0 }
        
        var f: [Int] = Array(repeating: 0, count: target + 1)
        f[0] = 1
        
        for i in 0...target {
            for num in nums {
                if i + num <= target {
                    f[i + num] += f[i]
                }
            }
        }
        return f[target]
    }
}
