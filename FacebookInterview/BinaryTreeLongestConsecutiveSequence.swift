//
//  BinaryTreeLongestConsecutiveSequence.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/28/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class BinaryTreeLongestConsecutiveSequence {
    func longestConsecutive(_ root: TreeNode?) -> Int {
        return helper(root, nil, 0)
    }
    
    func helper(_ current: TreeNode?, _ parent: TreeNode?, _ len: Int) -> Int {
        guard let current = current else { return 0 }
        
        var currentLen = 0
        if let p = parent, current.val == p.val + 1 {
            currentLen = len + 1
        } else {
            currentLen = 1
        }
        
        let left = helper(current.left, current, currentLen)
        let right = helper(current.right, current, currentLen)
        return max(left, right, currentLen)
    }
}
