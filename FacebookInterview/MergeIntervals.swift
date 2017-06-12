//
//  MergeIntervals.swift
//  FacebookInterview
//
//  Created by YangYusheng on 5/22/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class MergeIntervals {
    
    //keep previous start and end
    func merge(_ intervals: [Interval]) -> [Interval] {
        guard intervals.count > 0 else { return [] }
        let sortedIntervals = intervals.sorted(by: { $0.start < $1.start })
        var rst: [Interval] = []
        var start = sortedIntervals[0].start
        var end = sortedIntervals[0].end
        for interval in sortedIntervals {
            if interval.start <= end {
                start = min(start, interval.start)
                end = max(end, interval.end)
            } else {
                rst.append(Interval(start, end))
                start = interval.start
                end = interval.end
            }
        }
        rst.append(Interval(start, end))
        return rst
    }
}
