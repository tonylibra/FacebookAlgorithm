//
//  MeetingRoom.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/10/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation
class MeetingRoom {
    
    //meeting room I
    //just check is there overlap
    func canAttendMeetings(_ intervals: [Interval]) -> Bool {
        guard intervals.count > 0 else { return true }
        let sortedIntervals = intervals.sorted(by: { in1, in2 in
            in1.start < in2.start
        })
        
        var prev = sortedIntervals[0]
        for (idx, interval) in sortedIntervals.enumerated() {
            guard idx > 0 else { continue }
            if prev.end > interval.start {
                return false
            }
            prev = interval
        }
        return true
    }
    
    
    //meeting room II
    //1. sorted the intervals with start
    //2. make a min queue to store the end, only if current start > last min end, we pop out the end from minQueue
    //  since there is a corner case: [1, 7], [2, 3], [4, 8]. if we use start to arrange room, we need three rooms, but [2, 3], [4, 8] can share one room, and [1, 7] use another room
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        guard intervals.count > 0 else { return 0 }
        let sortedIntervals = intervals.sorted(by: { $0.start < $1.start })
        var array: [Int] = [] //queue array
        array.append(sortedIntervals[0].end)
        var cnt = 1 //!!!!!!!!!!!!!!!!!!!!!!!!
        for i in 1..<sortedIntervals.count { //traverse O(n)
            let interval = sortedIntervals[i]
            if interval.start < array[0] {
                cnt += 1
            } else {
                array.removeFirst()
            }
            self.insertValue(interval.end, in: &array)//sort O(lgn)
        }
        
        return cnt
    }
    
    func insertValue(_ val: Int, in sortedArray: inout [Int]) {
        guard sortedArray.count > 0 else {
            sortedArray.append(val)
            return
        }
        var left = 0
        var right = sortedArray.count - 1
        
        while left + 1 < right {
            let mid = left + (right - left) / 2
            if sortedArray[mid] == val {
                sortedArray.insert(val, at: mid)
                return
            } else if sortedArray[mid] < val {
                left = mid
            } else {
                right = mid
            }
        }
        
        if val <= sortedArray[left] {
            sortedArray.insert(val, at: left)
        } else if val <= sortedArray[right] {
            sortedArray.insert(val, at: right)
        } else {
            sortedArray.append(val)
        }
    }
}
