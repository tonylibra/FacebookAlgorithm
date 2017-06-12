//
//  TreeInorderTraversal.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/4/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TreeTraversal {
    func inorderStack(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var stack: [TreeNode] = []
        var node: TreeNode? = root
        var rst: [Int] = []
        
        while node != nil || !stack.isEmpty {
            if let curtNode = node {
                stack.append(curtNode)
                node = curtNode.left
            } else {
                let newNode = stack.removeLast()
                rst.append(newNode.val)
                node = newNode.right
            }
        }
        return rst
    }
    
    func preorderTraverse(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var stack: [TreeNode] = []
        stack.append(root)
        var rst: [Int] = []
        
        while !stack.isEmpty {
            let node = stack.removeLast()
            rst.append(node.val)
            if let right = node.right {
                stack.append(right)
            }
            if let left = node.left {
                stack.append(left)
            }
        }
        return rst
    }
    
//    func traverseTree(_ root: TreeNode?, with block: ((_ node: TreeNode, _ rst: inout [Int]) -> Void)) -> [Int] {
//        guard let node = root else { return [] }
//        var rst: [Int] = []
//        block(node, &rst)
//        return rst
//    }
//    
//    func inorderWithBlock(_ root: TreeNode?) {
//        return traverseTree(root) { (root, rst: inout [Int]) in
//            var stack: [TreeNode] = []
//            var node: TreeNode? = root
//            while node != nil || !stack.isEmpty {
//                if let curtNode = node {
//                    stack.append(curtNode)
//                    node = curtNode.left
//                } else {
//                    let newNode = stack.removeLast()
//                    rst.append(newNode.val)
//                    node = newNode.right
//                }
//            }
//        }
//    }
}
