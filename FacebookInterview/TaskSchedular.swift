//
//  TaskSchedular.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/24/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class TaskSchedular {
    //I, you have to do the task in order
    func leastIntervalI(_ tasks: [Character], _ n: Int) -> Int {
        guard tasks.count > 0 else { return 0 }
        var rst: Int = 0 //record the length of current tasks arrange
        var map: [Character: Int] = [:]//task : lastIdx
        for task in tasks {
            if let idx = map[task] {
                let currentLen = idx + n + 1
                if currentLen > rst {
                    rst = currentLen
                } else {
                    rst += 1
                }
            } else {
                rst += 1
            }
            map[task] = rst
        }
        return rst
    }
    
    
    //II, you can arrange the task with most optimized order to assure a least interval
    func leastIntervalII(_ tasks: [Character], _ n: Int) -> Int {
        guard tasks.count > 0 else { return 0 }
        var map: [Character: Int] = [:]
        for task in tasks {
            if let cnt = map[task] {
                map[task] = cnt + 1
            } else {
                map[task] = 1
            }
        }
        var orderedTasks: [Int] = map.map { (key, value) -> Int in
            return value
        }
        orderedTasks.sort { (num1, num2) -> Bool in
            return num1 > num2
        }
        let maxVal = orderedTasks[0] - 1
        var idenLen = maxVal * n
        for i in 1..<orderedTasks.count {
            idenLen -= min(orderedTasks[i], maxVal)
        }
        
        return idenLen > 0 ? tasks.count + idenLen : tasks.count
    }
}







