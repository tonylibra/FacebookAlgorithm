//
//  FlattenBinaryTreeToLinkedList.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/26/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class FlattenBinaryTreeToLinkedList {
    func singleList(_ root: TreeNode?) {
        var node = root
        var stackArr: [TreeNode] = []
        
        while let currentNode = node {
            if let right = currentNode.right {
                stackArr.append(right)
            }
            
            if let left = currentNode.left {
                currentNode.right = left
                currentNode.left = nil
            } else if !stackArr.isEmpty {
                currentNode.right = stackArr.removeLast()
            }
            node = currentNode.right
        }
    }
    
    //II, to bouble linked list
    //treeNode's left point to prev, and right point to next one
    func doubleList(_ root: TreeNode?) {
        guard let node = root else { return }
        var stackArr: [TreeNode] = []
        var prev: TreeNode?
        var tail: TreeNode? = node
        
        while tail != nil {
            if let right = tail?.right {
                stackArr.append(right)
            }
            if let left = tail?.left {
                tail?.right = left
            } else if !stackArr.isEmpty {
                let newNode = stackArr.removeLast()
                tail?.right = newNode
            }
            tail?.left = prev
            prev = tail
            tail = tail?.right
        }
    }
}
