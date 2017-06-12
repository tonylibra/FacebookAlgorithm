//
//  CancelableJob.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/2/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

//class Asyc {
//    static func workAfter(delay: Int, _ block: @escaping (() -> Void)) -> DispatchWorkItem {
//        let cancelableBlock = DispatchWorkItem {
//            block()
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: cancelableBlock)
//        return cancelableBlock
//    }
//}
//
//let work = Asyc.workAfter(delay: 4) {
//    print("hello world")
//}
//work.cancel()
