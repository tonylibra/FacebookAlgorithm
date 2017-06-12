//
//  BinarySearchTreeIterator.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/6/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//inorder
class BinarySearchTreeIterator {
    
    var stack: [TreeNode]
    init(_ root: TreeNode) {
        stack = []
        
        var node: TreeNode? = root
        while let curtNode = node {
            stack.append(curtNode)
            node = curtNode.left
        }
    }
    
    func next() -> Int {
        let curtNode = stack.removeLast()
        var node = curtNode.right
        
        while let tmpNode = node {
            stack.append(tmpNode)
            node = tmpNode.left
        }
        return curtNode.val
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}
