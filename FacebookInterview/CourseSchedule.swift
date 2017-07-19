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
    
    //another solutuion, but cannot ac
    func findOrderCannotAC(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        var degreeArr: [Int] = Array(repeating: 0, count: numCourses)
        var rst: [Int] = []
        
        if prerequisites.count == 0 {
            for i in 0..<numCourses {
                rst.append(i)
            }
            return rst
        }
        
        for pre in prerequisites {
            degreeArr[pre[0]] += 1
        }
        var queueArr: [Int] = []
        for degree in degreeArr {
            if degree == 0 {
                queueArr.append(degree)
            }
        }
        
        var nodeCount = 1
        while !queueArr.isEmpty {
            let node = queueArr.removeFirst()
            rst.append(node)
            for pre in prerequisites {
                if pre[1] == node {
                    degreeArr[pre[0]] -= 1
                    if degreeArr[pre[0]] == 0 {
                        queueArr.append(pre[0])
                        nodeCount += 1
                    }
                }
            }
        }
        if nodeCount == numCourses {
            return rst
        } else {
            return []
        }
    }
}
