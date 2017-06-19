//
//  InsertInterval.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/14/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class InsertInterval {
    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
        guard intervals.count > 0 else { return [] }
        
        var rst: [Interval] = []
        var added = false
        for interval in intervals {
            if newInterval.end < interval.start {
                if added == false {
                    rst.append(newInterval)
                    added = true
                }
                rst.append(interval)
            } else if newInterval.start > interval.end {
                rst.append(interval)
            } else {
                newInterval.start = min(newInterval.start, interval.start)
                newInterval.end = max(newInterval.end, interval.end)
            }
        }
        
        if added == false {
            rst.append(newInterval)
        }
        return rst
    }
}
