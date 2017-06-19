//
//  LRU.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/15/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class LRUNode {
    var key: Int
    var val: Int
    var next: LRUNode?
    var prev: LRUNode?
    
    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}

public class LRUCache {
    var capacity: Int
    var map: [Int: LRUNode]
    var head: LRUNode
    var tail: LRUNode
    init(_ capacity: Int) {
        self.capacity = capacity
        self.map = [:]
        head = LRUNode(-1, -1)
        tail = LRUNode(-1, -1)
    }
    
    func getValue(at key: Int) -> Int? {
        guard let node = map[key] else { return nil }
        node.prev?.next = node.next //remove node from current position at linked list
        node.next?.prev = node.prev
        moveNodeToTail(node) //add that node to tail
        return node.val
    }
    
    func putValue(_ value: Int, at key: Int) {
        if let _ = getValue(at: key) { //there is that node, use getValue function to make the node at the tail place, then update the value of that node
            map[key]!.val = value
            return
        }
        
        if map.count >= capacity { //if over size, remove the head
            map.removeValue(forKey: head.next!.key)
            head.next = head.next?.next
            head.next?.prev = head
        }
        
        let node = LRUNode(key, value)
        map[key] = node
        moveNodeToTail(node)
        
    }
    
    func moveNodeToTail(_ node: LRUNode) {
        tail.prev?.next = node
        node.prev = tail.prev
        node.next = tail
        tail.prev = node
    }
}
