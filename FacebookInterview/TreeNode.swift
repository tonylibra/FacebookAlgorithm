//
//  TreeNode.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/3/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TreeSerializeAndDeserialize { //preorder order serialize and deserialize
    func serialize(_ head: TreeNode?) -> String {
        guard let head = head else { return "null"}
        var stack: [TreeNode?] = []
        stack.append(head)
        
        var str = ""
        while !stack.isEmpty {
            if let node = stack.removeLast() {
                str += "\(node.val),"
                stack.append(node.right)
                stack.append(node.left)
            } else {
                str += "null,"
            }
        }
        return str.substring(from: 0, to: str.characters.count - 1)
    }
    
    func deserialize(from data: String) -> TreeNode? {
        let nodes = data.characters.split(separator: ",").map { String($0) }
        var pos = 0
        return helper(nodes, &pos)
    }
    func helper(_ nodes: [String], _ pos: inout Int) -> TreeNode? {
        if nodes[pos] == "null" {
            return nil
        }
        let root = TreeNode(Int(nodes[pos])!)
        pos += 1
        root.left = helper(nodes, &pos)
        pos += 1
        root.right = helper(nodes, &pos)
        return root
    }
}

extension TreeNode: Equatable {
    static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
    }
}
