//
//  BinaryTreepaths.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class BinaryTreePaths {
    //just recursive down
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        var rst: [String] = []
        var item = "\(root.val)"
        helper(root, &rst, item)
        return rst
    }
    
    //if leaf, add to rst, and return
    func helper(_ node: TreeNode, _ rst: inout [String], _ item: String) {
        if node.left == nil && node.right == nil {
            rst.append(item)
            return
        }
        
        if let left = node.left {
            helper(left, &rst, item + "->\(left.val)")
        }
        if let right = node.right {
            helper(right, &rst, item + "->\(right.val)")
        }
    }
}
