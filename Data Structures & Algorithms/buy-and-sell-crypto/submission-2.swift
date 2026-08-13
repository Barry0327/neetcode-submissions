class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var l = 0, r = 1
        var maxProfit = 0
        while r < prices.count {
            let profit = prices[r] - prices[l]
            if profit > 0 {
                maxProfit = max(maxProfit, profit)
            } else {
                l = r
            }
            r += 1
        }

        return maxProfit
    }
}
