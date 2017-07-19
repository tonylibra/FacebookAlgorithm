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
    
    //II, you can buy and sell as many times as you like
    //idea: This problem can be viewed as finding all ascending sequences. For example, given {5, 1, 2, 3, 4}, buy at 1 & sell at 4 is the same as buy at 1 &sell at 2 & buy at 2& sell at 3 & buy at 3 & sell at 4
    func maxProfitII(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        
        var profit: Int = 0
        for i in 1..<prices.count {
            let diff = prices[i] - prices[i-1]
            if diff > 0 {
                profit += diff
            }
        }
        
        return profit
    }
    
    //III, you can make at most 2 transaction, but can not engaged in multiple transactions at same time
    func maxProfitIII(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        
        var leftProfit: [Int] = Array(repeating: 0, count: prices.count)
        var rightProfit: [Int] = Array(repeating: 0, count: prices.count)
        
        var minVal = prices[0]
        for (idx, price) in prices.enumerated() {
            guard idx > 0 else { continue }
            leftProfit[idx] = max(leftProfit[idx-1], price - minVal)
            minVal = min(minVal, price)
        }
        
        var maxVal = prices[prices.count - 1]
        var idx = prices.count - 2
        while idx >= 0 {
            rightProfit[idx] = max(rightProfit[idx+1], maxVal - prices[idx])
            maxVal = max(maxVal, prices[idx])
            idx -= 1
        }
        
        var maxProfit = 0
        for i in 0..<prices.count {
            maxProfit = max(maxProfit, leftProfit[i] + rightProfit[i])
        }
        return maxProfit
    }
    
    //IV, same as III, but you can have at most k transactions. and same, you can not in multiple transactions at same time
    func maxProfitIV(_ k: Int, _ prices: [Int]) -> Int {
        return 0
    }
    
    
    //Best Time to Buy and Sell Stock with Cooldown
    //http://www.cnblogs.com/grandyang/p/4997417.html
    func maxProfitCoolDown(_ prices: [Int]) -> Int {
        guard prices.count > 0 else { return 0 }
        var buy = Int.min
        var sell = 0
        var pre_sell = 0
        var pre_buy = 0
        for price in prices {
            pre_buy = buy
            buy = max(pre_buy, pre_sell - price)
            pre_sell = sell
            sell = max(pre_buy + price, sell)
        }
        return sell
    }
    
    //follow up: sell with transaction fee
    func maxProfitWithFee(_ prices: [Int], _ fee: Int) -> Int {
        guard prices.count > 1 else { return 0 }
        var sum = 0
        var profit = 0
        for i in 1..<prices.count {
            let diff = prices[i] - prices[i-1]
            if diff > 0 {
                sum += diff
                profit += diff
            } else {
                sum -= (profit > fee ? fee : profit)
                profit = 0
            }
        }
        sum -= (profit > fee ? fee : profit)
        return sum
    }
}
