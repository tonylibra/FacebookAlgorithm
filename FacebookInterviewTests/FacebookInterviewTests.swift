//
//  FacebookInterviewTests.swift
//  FacebookInterviewTests
//
//  Created by YangYusheng on 5/18/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import XCTest
@testable import FacebookInterview

class FacebookInterviewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_wordbreak() {
        let str = "leetcoe"
        let dict = ["leet", "code"]
        let ws = WordBreak()
        XCTAssertTrue(ws.wordBreak(str, dict))
    }
    
    func test_randomPicket() {
        let nums = [0, 0, 0, 1, 0, 0, 0, 1, 0, 0]
        let picker = RandomPickIndex(nums)
        XCTAssertEqual(picker.picker(1), 7)
    }
    
    func test_loopLetters() {
        let unicode = UnicodeScalar(100)
        XCTAssertEqual(String(Character(unicode!)), "d")
    }
    
    func test_repalceCharacter() {
        let wordLadder = WordLadder()
        let newWord = wordLadder.generateNewWord("hello", 1, "a")
        XCTAssertEqual("hallo", newWord)
    }
    
    func test_wordLadder() {
        let wordLadder = WordLadder()
        let beginWord = "hit"
        let endWord = "cog"
        let wordList = ["hot","dot","dog","lot","log","cog"]
        let len = wordLadder.ladderLength(beginWord, endWord, wordList)
        XCTAssertEqual(len, 5)
    }
    
    func test_RegularMatching() {
        let s = "ab"
        let p = ".*"
        let regularMatch = RegularExpressionMatching()
        XCTAssertFalse(regularMatch.isMatch(s, p))
    }
    
    func test_substringFrom() {
        let hello = "hello"
        XCTAssertEqual(hello.substring(from: 1), "ello")
    }
    
    func test_something() {
        for i in "a"..."z" {
            print(i)
        }
    }
    
}
