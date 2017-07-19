//
//  ReadNCharactersGivenRead4.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/23/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class ReadNCharactersGivenRead4 {
    func read4(_ buf: inout [Character]) -> Int {
        return 4
    }
    
    //I
    //the result will store into buf
    func readI(_ buf: inout [Character], _ n: Int) -> Int {
        var buf4: Array<Character> = Array(repeating: Character(""), count: 4)
        var offset = 0
        
        while true {
            let len = read4(&buf4)
            var idx = 0
            while offset < n && idx < len {
                buf[offset] = buf4[idx]
                offset += 1
                idx += 1
            }
            if offset == n || len == 0 {
                return offset
            }
        }
    }
    
    //II, read function can be called multiple times
    //explain: when we call read(buf, n), to will ask read4 to get next 4 characters, but if we get n characters, we will stop read the buf4 which we get from read4. so there is some character left from buf4. when we call read(buf, n) second time, we do not what do lost remainning characters from buf4 we did not read from last time. 
    //so the point of II is that we should keep a instance variable of buf4, and last read index of buf4. so everytime when we call read(buf, n), we can continue on last index of buf4
    
    var buf4: [Character] = []
    var buf4Idx: Int = 4
    var buf4Len: Int = 4
    func readII(_ buf: inout [Character], _ n: Int) -> Int {
        for i in 0..<n {
            if !readNext(&buf, i) {
                return i
            }
        }
        return n
    }
    
    func readNext(_ buf: inout [Character], _ index: Int) -> Bool {
        if buf4Idx >= buf4Len {
            buf4Len = read4(&buf4)
            buf4Idx = 0
            if buf4Len == 0 {
                return false
            }
        }
        
        buf[index] = buf4[buf4Idx]
        buf4Idx += 1
        return true
    }
}












