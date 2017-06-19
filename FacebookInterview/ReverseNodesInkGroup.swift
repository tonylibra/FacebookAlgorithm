//
//  ReverseNodesInkGroup.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/15/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class ReverseNodesInKGroup {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let _ = head else { return nil }
        guard k > 1 else { return head }
        
        let dummyNode: ListNode = ListNode(0)
        dummyNode.next = head
        
        var nextHead: ListNode = dummyNode
        while let node = reverseNode(nextHead, with: k) {
            nextHead = node
        }
        return dummyNode.next
    }
    
    func reverseNode(_ node: ListNode, with k: Int) -> ListNode? {
        guard k > 1 else { return nil }
        
        var startNode = node.next
        for _ in 0..<k {
            guard let curtNode = startNode else { return nil }
            startNode = curtNode.next
        }
        
        var preNode = node.next
        var curtNode = preNode?.next
        
        for _ in 0..<(k-1) {
            let tmpNode = curtNode?.next
            curtNode?.next = preNode
            preNode = curtNode
            curtNode = tmpNode
        }
        
        let newHead = node.next
        newHead?.next = curtNode
        node.next = preNode
        return newHead
    }
}
