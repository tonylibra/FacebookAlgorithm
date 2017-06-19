//
//  SerializeandDeserializeBinaryTree.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/14/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class SerializeandDeserializeBinaryTree {
    
    func serialize(_ node: TreeNode) -> String { //preorder
        var rst = ""
        
        var stackArr: [TreeNode?] = []
        stackArr.append(node)
        
        while !stackArr.isEmpty {
            let node = stackArr.removeLast()
            if let curtNode = node {
                rst += "\(curtNode.val),"
                stackArr.append(curtNode.right)
                stackArr.append(curtNode.left)
            } else {
                rst += "#,"
            }
        }
        let len = rst.characters.count
        return rst.substring(to: len - 1)
    }
    
    func deserialize(_ data: String) -> TreeNode {
        let nodesVal = data.characters.split(separator: ",").map { String($0) }
        return deserializeHelper(nodesVal)!
    }
    
    var idx = 0
    func deserializeHelper(_ nodes: [String]) -> TreeNode? {
        if nodes[idx] == "#" {
            return nil
        }
        
        guard let nodeVal = Int(nodes[idx]) else { return nil }
        let root = TreeNode(nodeVal)
        idx += 1
        root.left = deserializeHelper(nodes)
        idx += 1
        root.right = deserializeHelper(nodes)
        return root
    }
    
    //Level Order
    func levelOrderSerialize(_ node: TreeNode) -> String {
        var queueArr: [TreeNode?] = []
        queueArr.append(node)
        
        var rst: String = ""
        while !queueArr.isEmpty {
            let node = queueArr.removeFirst()
            
            if let curtNode = node {
                rst += "\(curtNode.val),"
                queueArr.append(curtNode.left)
                queueArr.append(curtNode.right)
            } else {
                rst += "#,"
            }
        }
        
        let len = rst.characters.count
        return rst.substring(to: len - 1)
    }
    
    func levelOrderDeserialze(_ data: String) -> TreeNode {
        let valsArr = data.characters.split(separator: ",").map { String($0) }
        var nodeArr: [TreeNode] = []
        let root = TreeNode(Int(valsArr[0])!)
        nodeArr.append(root)
        
        var idx = 0 //use this idx to track parent
        var isLeftChild = true
        for i in 1..<valsArr.count { //linear increase the next node since is it level order traverse
            if valsArr[i] != "#" {
                let curtNode = TreeNode(Int(valsArr[i])!)
                if isLeftChild {
                    nodeArr[idx].left = curtNode
                } else {
                    nodeArr[idx].right = curtNode
                }
                nodeArr.append(curtNode)
            }
            if isLeftChild == false { //update the parent after right node
                idx += 1
            }
            isLeftChild = !isLeftChild //switch between left and right
        }
        return root
    }
}
