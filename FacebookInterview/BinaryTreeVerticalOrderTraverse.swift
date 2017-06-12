//
//  BinaryTreeVerticalOrderTraverse.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation


//things need take care: output order
class BinaryTreeVerticalOrderTraverse {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var nodeArr: [TreeNode] = []
        var indexArr: [Int] = []
        var minIdx = 0
        var maxIdx = 0
        
        var map: [Int: [Int]] = [:]
        nodeArr.append(root)
        indexArr.append(0)
        
        while !nodeArr.isEmpty {
            let node = nodeArr.removeFirst()
            let idx = indexArr.removeFirst()
            minIdx = min(minIdx, idx)
            maxIdx = max(maxIdx, idx)
            if map[idx] == nil {
                map[idx] = [node.val]
            } else {
                map[idx]!.append(node.val)
            }
            
            if let left = node.left {
                nodeArr.append(left)
                indexArr.append(idx - 1)
            }
            if let right = node.right {
                nodeArr.append(right)
                indexArr.append(idx + 1)
            }
        }
        
        var rst: [[Int]] = []
        for i in minIdx...maxIdx {
            rst.append(map[i]!)
        }
        return rst
    }
}
