//
//  wordLadder.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/28/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//1. for loop every next word, and recursive all cases
//2. save the next words in a queue
//3. save all probability in a record array to avoid duplicates
public class WordLadder {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard wordList.count > 0 else { return 0 }
        guard beginWord != endWord else { return 1 }
        
        let dic: Set<String> = Set(wordList)
        var queue: [String] = []
        var record: [String] = []
        queue.append(beginWord)
        record.append(beginWord)
        var len = 1
        
        while !queue.isEmpty {
            len += 1
            let size = queue.count
            for _ in 0..<size {
                let prevWord = queue.removeFirst()
                let nextWords = self.nextWords(prevWord, dic)
                for next in nextWords {
                    guard !record.contains(next) else { continue } //avoid dup
                    if next == endWord {
                        return len
                    }
                    
                    queue.append(next)
                    record.append(next)
                }
            }
        }
        return 0
    }
    
    func nextWords(_ word: String, _ wordList: Set<String>) -> [String] {
        guard let start = UnicodeScalar("a")?.value, let end = UnicodeScalar("z")?.value else { return [] }
        
        var newWords: [String] = []
        for i in 0..<word.characters.count {
            for uni in start...end { //replace i-th letter with a...z
                let letter = String(Character(UnicodeScalar(uni)!))
                guard word[i] != letter else { continue }
                
                let newWord = generateNewWord(word, i, letter)
                if wordList.contains(newWord) { //add to wordList if exist in dict
                    newWords.append(newWord)
                }
            }
        }
        return newWords
    }
    
    func generateNewWord(_ word: String, _ pos: Int, _ letter: String) -> String {
        var newWord = ""
        guard pos < word.characters.count else { return "" }
        for (idx, ele) in word.characters.enumerated() {
            guard idx != pos else {
                newWord += letter
                continue
            }
            newWord += String(ele)
        }
        return newWord
    }
}
