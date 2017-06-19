//
//  MergeKSortedLists.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/13/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MergeKSortedLists {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        var array = lists
        while array.count > 1 {
            let l1 = array.removeFirst()
            let l2 = array.removeFirst()
            array.append(merge(l1, l2))
        }
        return array[0]
    }
    
    func merge(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil && list2 == nil {
            return nil
        }
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        
        let dummyNode: ListNode = ListNode(0)
        var node = dummyNode
        var node1 = list1, node2 = list2
        while let curt1 = node1, let curt2 = node2 {
            if curt1.val < curt2.val {
                node.next = curt1
                node1 = curt1.next
            } else {
                node.next = curt2
                node2 = curt2.next
            }
            node = node.next!
        }
        
        if node1 == nil {
            node.next = node2
        }
        if node2 == nil {
            node.next = node1
        }
        return dummyNode.next
    }
}
