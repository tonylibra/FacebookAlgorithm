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
    
    func test_leastIntervalII() {
        let taskScheduler = TaskSchedular()
        let tasks: [Character] = ["A", "B", "C","D", "E", "A", "B","C", "D", "E"]
        XCTAssertEqual(taskScheduler.leastIntervalII(tasks, 4), 10)
        
    }
    
    func test_findAllAnagram() {
        let testFind = FindAllAnagramsInAString()
        let rst = testFind.findAnagramsII("cbaebabacd", "abc")
        XCTAssertEqual(rst, [0, 6])
    }
    
    func test_BTToDLL() {
        let testObj = FlattenBinaryTreeToLinkedList()
        var node: TreeNode? = getBinaryTree()
        testObj.doubleList(node)
        
        XCTAssertEqual(node?.val, 4)
        XCTAssertEqual(node?.right?.val, 2)
        XCTAssertNil(node?.left)
        node = node?.right
        XCTAssertEqual(node?.val, 2)
        XCTAssertEqual(node?.right?.val, 1)
        XCTAssertEqual(node?.left?.val, 4)
        node = node?.right
        XCTAssertEqual(node?.val, 1)
        XCTAssertEqual(node?.right?.val, 3)
        XCTAssertEqual(node?.left?.val, 2)
        node = node?.right
        XCTAssertEqual(node?.val, 3)
        XCTAssertEqual(node?.right?.val, 6)
        XCTAssertEqual(node?.left?.val, 1)
        node = node?.right
        XCTAssertEqual(node?.val, 6)
        XCTAssertEqual(node?.right?.val, 5)
        XCTAssertEqual(node?.left?.val, 3)
        node = node?.right
        XCTAssertEqual(node?.val, 5)
        XCTAssertEqual(node?.right?.val, 7)
        XCTAssertEqual(node?.left?.val, 6)
        node = node?.right
        XCTAssertEqual(node?.val, 7)
        XCTAssertNil(node?.right)
        XCTAssertEqual(node?.left?.val, 5)
    }

    func test_BTToDLL2() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        node1.left = node2
        var node: TreeNode? = node1
        let testObj = FlattenBinaryTreeToLinkedList()
        testObj.doubleList(node)
        
        XCTAssertEqual(node?.val, 1)
        XCTAssertEqual(node?.right?.val, 2)
        XCTAssertNil(node?.left)
        node = node?.right
        XCTAssertEqual(node?.val, 2)
        XCTAssertNil(node?.right)
        XCTAssertEqual(node?.left?.val, 1)
    }
    func test_BTToDLL3() {
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        node1.right = node2
        var node: TreeNode? = node1
        let testObj = FlattenBinaryTreeToLinkedList()
        testObj.doubleList(node)
        
        XCTAssertEqual(node?.val, 1)
        XCTAssertEqual(node?.right?.val, 2)
        XCTAssertNil(node?.left)
        node = node?.right
        XCTAssertEqual(node?.val, 2)
        XCTAssertNil(node?.right)
        XCTAssertEqual(node?.left?.val, 1)
    }
    func test_BTToDLL4() {
        let node1 = TreeNode(1)
        let node: TreeNode? = node1
        let testObj = FlattenBinaryTreeToLinkedList()
        testObj.doubleList(node)
        XCTAssertEqual(node?.val, 1)
        XCTAssertNil(node?.right)
        XCTAssertNil(node?.left)
    }
    
    func test_stackWithFee() {
        let stock = BestTimeToSellStock()
        let prices = [1, 2, 3, 4, 5, 4, 3, 2, 1, 0]
        let fee = 1
        
        let profit = stock.maxProfitWithFee(prices, fee)
        XCTAssertEqual(profit, 3)
    }
    func test_moveZero() {
        var nums: [Int] = [0, 1, 0, 3, 12]
        let test = MoveZero()
        test.moveZeroes(&nums)
        XCTAssertEqual([12, 1, 3, 0, 0], nums)
    }
}















