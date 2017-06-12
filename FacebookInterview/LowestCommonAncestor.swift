//
//  LowestCommonAncestor.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/24/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class LCA {
    func findLCA(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
        guard let root = root else { return nil }
        if root == p || root == q {
            return root
        }
        
        let left: TreeNode? = findLCA(root.left, p, q)
        let right: TreeNode? = findLCA(root.right, p, q)
        
        if left != nil && right != nil {
            return root
        }
        if left == nil {
            return right
        }
        if right == nil {
            return left
        }
        return nil
    }
}
