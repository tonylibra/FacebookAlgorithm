//
//  ConstructBianryTree.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class ConstructBinaryTreefromPreorderandInorderTraversal {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return buildTreeHelper(preorder, inorder, 0, preorder.count - 1, 0, inorder.count - 1)
    }
    
    func buildTreeHelper(_ preorder: [Int], _ inorder: [Int],  _ preStart: Int, _ preEnd: Int, _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        if preStart > preEnd || inStart > inEnd {
            return nil
        }
        
        let nodeVal = preorder[preStart]
        let node = TreeNode(nodeVal)
        
        var k = 0
        for i in inStart...inEnd {
            if inorder[i] == nodeVal {
                k = i
                break
            }
        }
        
        node.left = buildTreeHelper(preorder, inorder, preStart + 1, preStart + (k - inStart), inStart, k - 1)
        node.right = buildTreeHelper(preorder, inorder, preStart + (k - inStart) + 1, preEnd, k + 1, inEnd)
        return node
    }
}

class ConvertSortedArraytoBibarySearchTree {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArryToBSTHelper(nums, 0, nums.count - 1)
    }
    
    func sortedArryToBSTHelper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        
        let mid = (left + right) / 2
        let root = TreeNode(nums[mid])
        root.left = sortedArryToBSTHelper(nums, left, mid - 1)
        root.right = sortedArryToBSTHelper(nums, mid + 1, right)
        
        return root
    }
}

class ConvertSortedListToBinarySearchTree {
    
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        current = head
        let len = getLength(head)
        return sortedListToBSTHelper(len)
    }
    
    var current: ListNode?
    private func getLength(_ head: ListNode?) -> Int {
        var len = 0
        var node: ListNode? = head
        while let curtNode = node {
            len += 1
            node = curtNode.next
        }
        
        return len
    }
    
    func sortedListToBSTHelper(_ len: Int) -> TreeNode? {
        if len <= 0 {
            return nil
        }

        let left = sortedListToBSTHelper(len / 2)
        let root = TreeNode(current!.val)
        current = current?.next
        let right = sortedListToBSTHelper(len - len/2 - 1)
        root.left = left
        root.right = right
        
        return root
    }
}









