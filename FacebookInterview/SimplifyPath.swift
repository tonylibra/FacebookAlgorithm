//
//  SimplifyPath.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/12/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class SimplifyPath {
    func simplifyPath(_ path: String) -> String {
        var stackArr: [String] = []
        let pathArr = path.characters.split(separator: "/").map { String($0) }
        for path in pathArr {
            if path == "." || path == "" {
                continue
            } else if path == ".."{
                if !stackArr.isEmpty {
                    stackArr.removeLast()
                }
            } else {
                stackArr.append(path)
            }
        }
        
        var rst = ""
        for dir in stackArr {
            rst.append("/\(dir)")
        }
        
        return rst == "" ? "/" : rst
    }
}
