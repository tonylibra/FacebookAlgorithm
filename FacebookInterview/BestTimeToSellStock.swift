//
//  BestTimeToSellStock.swift
//  FacebookInterview
//
//  Created by YangYusheng on 6/16/17.
//  Copyright © 2017 yusheng. All rights reserved.
//

import Foundation

class BestTimeToSellStock {
    //keep the minPrice, count the (currentPrice - minPrice)
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var minPrice = prices[0]
        var profit: Int = 0
        for price in prices {
            profit = max(profit, price - minPrice)
            minPrice = min(minPrice, price)
        }
        
        return profit
    }
}
