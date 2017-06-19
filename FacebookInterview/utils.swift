//
//  utils.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/18/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
    }
}

class TrieNode {
    var val: String
    var children: [String: TrieNode]
    var isWord: Bool
    init(_ val: String = "#") {
        self.val = val
        self.children = [:]
        self.isWord = false
    }
}

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
    }
}

extension String {
    subscript(i: Int) -> String {
        let index = self.index(startIndex, offsetBy: i)
        return String(self[index])
    }
    
    func substring(from: Int, to: Int) -> String {
        let start = self.index(startIndex, offsetBy: from)
        let end = self.index(startIndex, offsetBy: to)
        return self.substring(with: start..<end)
    }
    
    func substring(from start: Int) -> String {
        guard start < self.characters.count else { return "" }
        let startIdx = self.index(startIndex, offsetBy: start)
        return self.substring(from: startIdx)
    }
    
    func substring(to end: Int) -> String {
        let endIdx = self.index(startIndex, offsetBy: end)
        return self.substring(to: endIdx)
    }
}

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

public class UndirectedGraphNode {
    var label: Int
    var neighbors: [UndirectedGraphNode]
    init(label: Int) {
        self.label = label
        neighbors = []
    }
}

extension UndirectedGraphNode: Equatable {
    static public func ==(lhs: UndirectedGraphNode, rhs: UndirectedGraphNode) -> Bool {
        return false
    }
}

extension UndirectedGraphNode: Hashable {
    public var hashValue: Int {
        return 0
    }
}
