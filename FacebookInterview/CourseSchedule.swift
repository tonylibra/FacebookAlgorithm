//
//  CourseSchedule.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class Node {
    var val: Int
    var degree: Int
    var children: [Node]
    
    init(_ val: Int) {
        self.val = val
        self.degree = 0
        self.children = []
    }
}

class CourseSchedule {
    func findOrderII(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var dict: [Int: Node] = [:]
        for i in 0..<numCourses {
            dict[i] = Node(i)
        }
        
        for prereq in prerequisites {
            guard let node = dict[prereq[0]] else { return [] }
            node.degree += 1
            if let fNode =  dict[prereq[1]] {
                fNode.children.append(node)
            }
        }
        
        var queue: [Node] = []
        for node in dict.values {
            if node.degree == 0 {
                queue.append(node)
            }
        }
        
        var rst: [Int] = []
        while !queue.isEmpty {
            let node = queue.removeFirst()
            rst.append(node.val)
            for child in node.children {
                child.degree -= 1
                if child.degree == 0 {
                    queue.append(child)
                }
            }
        }
        
        for node in dict.values {
            if node.degree != 0 {
                return []
            }
        }
        return rst
    }
}
