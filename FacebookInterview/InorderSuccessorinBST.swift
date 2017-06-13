//
//  InorderSuccessorinBST.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/12/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class InorderSuccessorInBST {
    func inorderSuccessor(_ root: TreeNode, _ p: TreeNode) -> TreeNode? {
        var node: TreeNode? = root
        var pre: TreeNode?
        while node?.val != p.val {
            guard let curtNode = node else { return nil }
            if p.val < curtNode.val {
                pre = curtNode //!! only update pre here
                node = curtNode.left
            } else if p.val > curtNode.val {
                node = curtNode.right
            }
        }
        
        if let right = node?.right {
            var curtNode = right
            while curtNode.left != nil {
                curtNode = curtNode.left!
            }
            return curtNode
        } else {
            return pre
        }
    }
}
