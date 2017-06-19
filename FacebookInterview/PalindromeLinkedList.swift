//
//  PalindromeLinkedList.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class PalindromeLinkedList {
    //1. find the middle
    //2. reverse the other part
    //3. compare
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard let node = head else { return true }
        guard let middle = findMiddle(node) else { return false }
        
        middle.next = reverse(middle.next)
        var node1: ListNode? = node
        var node2: ListNode? = middle.next
        
        while let n1 = node1, let n2 = node2  {
            guard n1.val == n2.val else { break }
            node1 = n1.next
            node2 = n2.next
        }
        return node2 == nil
    }
    
    func findMiddle(_ node: ListNode) -> ListNode? { //slow will len / 2
        var slow: ListNode? = node
        var fast: ListNode? = node.next
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        return slow
    }
    
    func reverse(_ node: ListNode?) -> ListNode? {
        guard let node = node else { return nil }
        var pre: ListNode? = nil
        var curt: ListNode? = node
        
        while curt != nil {
            let tmp = curt!.next
            curt!.next = pre
            pre = curt
            curt = tmp
        }
        return pre
    }
}
