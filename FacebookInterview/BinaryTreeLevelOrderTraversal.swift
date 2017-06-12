//
//  BinaryTreeLevelOrderTraversal.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/11/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class BinaryTreeLevelOrderTraverse {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var rst: [[Int]] = []
        var queueArray: [TreeNode] = []
        queueArray.append(root)
        
        while !queueArray.isEmpty {
            let size = queueArray.count
            var level: [Int] = []
            for _ in 0..<size {
                let node = queueArray.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queueArray.append(left)
                }
                if let right = node.right {
                    queueArray.append(right)
                }
            }
            rst.append(level)
        }
        return rst
    }
}
