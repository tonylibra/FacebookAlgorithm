//
//  TreeNodeTraverse.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/14/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TreeNodeTraverse {
    func inoder(_ node: TreeNode) -> [Int] {
        var rst: [Int] = []
        
        var stackArr: [TreeNode] = []
        var node: TreeNode?
        
        while node != nil || !stackArr.isEmpty {
            if let curtNode = node {
                stackArr.append(curtNode)
                node = curtNode.left
            } else {
                let newNode = stackArr.removeLast()
                rst.append(newNode.val)
                node = newNode.right
            }
        }
        return rst
    }

    func preprder(_ root: TreeNode) -> [Int] {
        var rst: [Int] = []
        
        var stackArr: [TreeNode] = []
        stackArr.append(root)
        
        while !stackArr.isEmpty {
            let node = stackArr.removeLast()
            rst.append(node.val)
            if let right = node.right {
                stackArr.append(right)
            }
            if let left = node.left {
                stackArr.append(left)
            }
        }
        return rst
    }
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        var rst: [Int] = []
        helper(node, &rst)
        return rst
    }
    
    func helper(_ root: TreeNode, _ rst: inout [Int]) {
        if let left = root.left {
            helper(left, &rst)
        }
        if let right = root.right {
            helper(right, &rst)
        }
        rst.append(root.val)
    }
    
    ////////
    func levelOrder(_ root: TreeNode) -> [[Int]] {
        var rst: [[Int]] = []
        var queueArr: [TreeNode] = []
        queueArr.append(root)
        
        while !queueArr.isEmpty {
            let size = queueArr.count
            var item: [Int] = []
            for _ in 0..<size {
                let node = queueArr.removeFirst()
                item.append(node.val)
                if let left = node.left {
                    queueArr.append(left)
                }
                if let right = node.right {
                    queueArr.append(right)
                }
            }
            rst.append(item)
        }
        return rst
    }
    
    func verticalOrder(_ root: TreeNode) -> [[Int]] {
        var rst: [[Int]] = []
        var levelArr: [Int] = []
        var nodeArr: [TreeNode] = []
        
        nodeArr.append(root)
        levelArr.append(0)
        var map: [Int: [Int]] = [:]
        var minVal = Int.max
        var maxVal = Int.min
        while !nodeArr.isEmpty {
            let node = nodeArr.removeFirst()
            let level = levelArr.removeFirst()
            
            minVal = min(minVal, level)
            maxVal = max(maxVal, level)
            
            if map[level] != nil {
                map[level]!.append(node.val)
            } else {
                map[level] = [node.val]
            }
            
            if let left = node.left {
                nodeArr.append(left)
                levelArr.append(level - 1)
            }
            if let right = node.right {
                nodeArr.append(right)
                levelArr.append(level + 1)
            }
        }
        
        for i in minVal...maxVal {
            rst.append(map[i]!)
        }
        
        return rst
    }
    
    func inorderTraverseHelper(_ node: TreeNode, valueHandler: (_ val: Int) -> Bool) { //inorder
        if let left = node.left {
            inorderTraverseHelper(left, valueHandler: valueHandler)
        }
        
        let rst = valueHandler(node.val)
        if rst {
            print(node.val)
        }
        
        if let right = node.right {
            inorderTraverseHelper(right, valueHandler: valueHandler)
        }
    }
}
