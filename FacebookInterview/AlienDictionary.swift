//
//  AlienDictionary.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/15/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TopoNode {
    var val: String
    var degree: Int
    var children: [TopoNode]
    
    init(_ val: String) {
        self.val = val
        self.degree = 0
        self.children = []
    }
}

class AlienDictioanry {
    func alienOrder(_ words: [String]) -> String {
        guard words.count > 0 else { return  "" }
        guard words.count > 1 else { return words[0] }
        var dict: [String: TopoNode] = [:]
        
        //build graph
        for i in 0..<(words.count-1) {
            let word1 = words[i]
            let word2 = words[i+1]
            let len1 = word1.characters.count
            let len2 = word2.characters.count
            var m = 0
            while m < len1 && m < len2 && word1[m] == word2[m] {
                if dict[word1[m]] == nil {
                    dict[word1[m]] = TopoNode(word1[m])
                }
                m += 1
            }
            for i in m..<len1 {
                if dict[word1[i]] == nil {
                    dict[word1[i]] = TopoNode(word1[i])
                }
            }
            for i in m..<len2 {
                if dict[word2[i]] == nil {
                    dict[word2[i]] = TopoNode(word2[i])
                }
            }
            
            guard m < len1 && m < len2 else { continue }
            guard let parentNode = dict[word1[m]], let childNode = dict[word2[m]] else { return "" }
            parentNode.children.append(childNode)
            childNode.degree += 1
        }
        
        //sort
        var queueArr: [TopoNode] = []
        for node in dict.values {
            if node.degree == 0 {
                queueArr.append(node)
            }
        }
        
        var rstStr = ""
        while !queueArr.isEmpty {
            let node = queueArr.removeFirst()
            rstStr += node.val
            
            for childNode in node.children {
                childNode.degree -= 1
                if childNode.degree == 0 {
                    queueArr.append(childNode)
                }
            }
        }
        
        for node in dict.values {
            if node.degree != 0 {
                return ""
            }
        }
        return rstStr
    }
}
