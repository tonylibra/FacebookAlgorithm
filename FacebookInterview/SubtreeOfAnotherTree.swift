//
//  SubTr.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class SubtreeOfAnotherTree {
    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        guard let s = s, let t = t else { return false }
        if s.val == t.val {
            return sameTree(s, t) || isSubtree(s.left, t) || isSubtree(s.right, t)
        } else {
            return isSubtree(s.left, t) || isSubtree(s.right, t)
        }
    }
    
    func sameTree(_ node1: TreeNode?, _ node2: TreeNode?) -> Bool {
        if node1 == nil && node2 == nil {
            return true
        }
        guard let node1 = node1, let node2 = node2 else { return false }
        if node1.val != node2.val {
            return false
        }
        return sameTree(node1.left, node2.left) && sameTree(node1.right, node2.right)
    }
}
