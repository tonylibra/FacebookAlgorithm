//
//  PopulatingNextRightPointersinEachNode.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/12/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TreeLinkNode {
    var val: Int
    var left: TreeLinkNode?
    var right: TreeLinkNode?
    var next: TreeLinkNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

class PopulatingNextRightPointersinEachNode {
    //I, a perfect tree
    //simply level order traverse, and connect each node in a level
    func connectI(_ root: TreeLinkNode) {
        
    }
    
    //II: not a perfect tree
    func connectII(_ root: TreeLinkNode) {
        var parent: TreeLinkNode? = root
        
        while parent != nil {
            var pNext: TreeLinkNode?
            var pre: TreeLinkNode?
            
            while let currentParent = parent {
                if pNext == nil {
                    pNext = currentParent.left ?? currentParent.right
                }
                
                if let left = currentParent.left {
                    if let curtPre = pre {
                        curtPre.next = left
                        pre = curtPre.next
                    } else {
                        pre = left
                    }
                }
                if let right = currentParent.right {
                    if let curtPre = pre {
                        curtPre.next = right
                        pre = curtPre.next
                    } else {
                        pre = right
                    }
                }
                parent = currentParent.next
            }
            parent = pNext
        }
    }
}
