//
//  KVCExperiment.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/3/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation
protocol KVC {
    func valueForKey<T>(_ key: String) -> T?
}

extension KVC {
    func valueForKey<T>(_ key: String) -> T? {
        let keys = Mirror(reflecting: self)//reflect(self)
        
        for child in keys.children {
            guard let childKey = child.label else { return nil }
            if childKey == key {
                return child.value as? T
            }
        }
        return nil
    }
}

class KVCExperiment: KVC {
    var a: String
    var b: String
    var c: String
    
    init() {
        a = "a"
        b = "b"
        c = "c"
    }
}


