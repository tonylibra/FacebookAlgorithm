//
//  ImplementTrie.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/18/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class Trie {
    var root: TrieNode
    init() {
        root = TrieNode()
    }
    
    //for loop each letter in word
    //update the curtNode
    //last, curtNode.isWrod = true
    func insert(_ word: String) {
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
    
    func search(_ word: String) -> Bool {
        guard let lastNode = searchHelper(word) else { return false }
        return lastNode.isWord
    }
    
    func startWith(_ prefix: String) -> Bool {
        guard let _ = searchHelper(prefix) else { return false }
        return true
    }
    
    func searchHelper(_ word: String) -> TrieNode? {
        var curtNode = root
        for i in 0..<word.characters.count {
            let letter = word[i]
            if let nextNode = curtNode.children[letter] {
                curtNode = nextNode
            } else {
                return nil
            }
        }
        return curtNode
    }
}
