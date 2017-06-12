//
//  CloneGraph.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/24/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation


//not hard, keep the process in mind
//1. store all nodes in the array, use queue
//2. copy the nodes, use map
//3. copy the children
class CloneGraph {
    func cloneGraph(_ node: UndirectedGraphNode?) -> UndirectedGraphNode? {
        guard let node = node else { return nil }
        let nodes = getNodes(from: node)
        var map: [UndirectedGraphNode: UndirectedGraphNode] = [:]
        
        for n in nodes {
            map[n] = UndirectedGraphNode(label: n.label)
        }
        
        for n in nodes {
            guard let newNode = map[n] else { return nil }
            for child in n.neighbors {
                guard let newNeighbor = map[child] else { return nil }
                newNode.neighbors.append(newNeighbor)
            }
        }
        
        return map[node] ?? nil
    }
    
    func getNodes(from node: UndirectedGraphNode) -> [UndirectedGraphNode] {
        var nodes: [UndirectedGraphNode] = []
        var queue: [UndirectedGraphNode] = []
        queue.append(node)
        while !queue.isEmpty {
            let tmpNode = queue.removeFirst()
            for n in tmpNode.neighbors {
                if !nodes.contains(n) {
                    queue.append(n)
                    nodes.append(n)
                }
            }
        }
        return nodes
    }
}
