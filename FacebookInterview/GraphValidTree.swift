//
//  GraphValidTree.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/12/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class GraphValidTree {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        var visited: [Bool] = Array(repeating: false, count: n) //avoid revisite same node, since this is undirect graph
        var dic: [Int: [Int]] = [:] //node: children
        
        for i in 0..<n {
            dic[i] = []
        }
        for edge in edges {
            dic[edge[0]]!.append(edge[1])
            dic[edge[1]]!.append(edge[0])
        }
        var queueArr: [Int] = []
        queueArr.append(0) // add root to the queue
        
        while !queueArr.isEmpty{
            let node = queueArr.removeFirst()
            if visited[node] {
                return false
            }
            
            visited[node] = true
            for child in dic[node]! {
                guard visited[child] == false else { continue }
                queueArr.append(child)
            }
        }
        
        for node in visited {
            if node == false {
                return false
            }
        }
        return true
    }
}
