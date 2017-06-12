//
//  AddAndSearchWord.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/18/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class WordDictionary {
    var root: TrieNode
    init() {
        root = TrieNode()
    }
    
    func addWord(_ word: String) {
        guard word.characters.count > 0 else { return }
        var curtNode = root
        for i in 0..<word.characters.count {
            let letter = word[i]
            if curtNode.children[letter] == nil {
                curtNode.children[letter] = TrieNode()
            }
            curtNode = curtNode.children[letter]!
        }
        curtNode.isWord = true
    }
    
    func searchWord(_ word: String) -> Bool {
        guard word.characters.count > 0 else { return false }
        return find(word, 0, root)
    }
    
    func find(_ word: String, _ pos: Int, _ node: TrieNode) -> Bool{
        if pos == word.characters.count {
            return node.isWord
        }
        
        let letter = word[pos]
        if letter == "." {
            for item in node.children {
                if find(word, pos + 1, item.value) {
                    return true
                }
            }
            return false
        } else if let curtNode = node.children[letter] {
            return find(word, pos + 1, curtNode)
        } else {
            return false
        }
    }
}
