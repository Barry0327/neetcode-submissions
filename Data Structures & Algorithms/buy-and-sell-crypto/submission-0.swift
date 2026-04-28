class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var profit = 0
        var buyPrice = prices[0]
        for i in 1..<prices.count {
            let sellPrice = prices[i]
            profit = max(profit, sellPrice - buyPrice)
            buyPrice = min(buyPrice, sellPrice)
        }

        return profit
    }
}
