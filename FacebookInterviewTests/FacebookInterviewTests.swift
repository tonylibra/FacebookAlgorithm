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
        let obj = AlienDictioanry()
        let str = obj.alienOrder(["wrt","wrf","er","ett","rftt"])
        XCTAssertEqual(str, "wertf")
    }
    
    func test_BTInroder() {
        let root = getBinaryTree()
        let obj = TreeNodeTraverse()
        obj.inorderTraverseHelper(root) { (val) -> Bool in
            if val > 5 {
                return false
            }
            return true
        }
    }
    
    func getBinaryTree() -> TreeNode {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        let node4 = TreeNode(4)
        let node5 = TreeNode(5)
        let node6 = TreeNode(6)
        let node7 = TreeNode(7)
        node4.left = node2
        node2.left = node1
        node2.right = node3
        node4.right = node6
        node6.left = node5
        node6.right = node7
        return node4
    }
}















