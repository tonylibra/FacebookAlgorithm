//
//  SumOfLeftLeaves.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class SumOfLeftLeaves {
    //just traverse the tree, if left node is leaf, add to sum
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let node = root else { return 0 }
        
        var sum = 0
        if let left = node.left {
            if left.left == nil && left.right == nil { //left leaf
                sum += left.val
            } else { //not a leaf
                sum += sumOfLeftLeaves(node.left)
            }
        }
        
        sum += sumOfLeftLeaves(node.right) //do the same thing for right node
        
        return sum
    }
}
