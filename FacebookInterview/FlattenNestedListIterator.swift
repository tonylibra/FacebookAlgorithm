//
//  FlattenNestedListIterator.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/3/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//class NestedInteger {
//    private var _array: [NestedInteger]?
//    private var _num: Int?
//    
//    init(_ num: Int) {
//        _num = num
//    }
//    
//    init(_ list: [Any]) {
//        for item in list {
//            if let intVal = item as? Int {
//                _array?.append(NestedInteger(intVal))
//            }
//            if let arrayVal = item as? Array<AnyObject> {
//                _array?.append(NestedInteger(arrayVal))
//            }
//        }
//    }
//    
//    func getInteger() -> Int? {
//        return _num
//    }
//    func getList() -> [NestedInteger]? {
//        return _array
//    }
//}

protocol NestedInteger {
    var isInteger: Bool { get }
    func getList() -> [NestedInteger]?
    func getInteger() -> Int?
}

//struct FlattenNestedListIterator: IteratorProtocol, Sequence {
//    var stack: [NestedInteger]
//    
//    init(_ list: [NestedInteger]) {
//        stack = list.reversed()
//    }
//    
//    mutating func next() -> Int? {
//        while let last = stack.last, let list = last.getList() {
//            stack.append(contentsOf: list.reversed())
//        }
//        
//        guard let last = stack.popLast() else { return nil }
//        return last.getInteger()
//    }
//}

//1. store the list into stack, but keep the lower index of list at the top of stack
struct FlattenNestedListIterator {
    var stack: [NestedInteger]
    init(_ list: [NestedInteger]) {
        stack = list.reversed() //!!!!!!reversed!
    }
    
    mutating func next() -> Int {
        let item = stack.removeLast()
        return item.getInteger()!
    }
    
    //recursive
    mutating func hasNext() -> Bool {
        guard !stack.isEmpty else { return false }
        var item = stack.removeLast()
        while !item.isInteger {
            guard let list = item.getList() else { return false }
            stack.append(contentsOf: list.reversed())
            item = stack.removeLast()
        }
        stack.append(item)
        return true
    }
}
















