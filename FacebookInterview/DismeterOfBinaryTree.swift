//
//  DismeterOfBinaryTree.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class DismeterOfBinaryTree {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        var maxpath = heightOfTree(node.left) + heightOfTree(node.right)
        maxpath = max(maxpath, diameterOfBinaryTree(node.left), diameterOfBinaryTree(node.right))
        return maxpath
    }
    
    func heightOfTree(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        return max(heightOfTree(node.left), heightOfTree(node.right)) + 1
    }
}
