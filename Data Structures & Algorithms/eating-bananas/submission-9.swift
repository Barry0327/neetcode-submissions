class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        func hoursNeeded(_ k: Int) -> Int {
            var result = 0

            for pile in piles {
                var hour = pile / k
                if pile % k != 0 {
                    hour += 1
                }
                result += hour
            }
            return result
        }

        let max = piles.max()!
        var left = 1, right = max

        while left < right {
            let mid = left + (right - left) / 2
            let hours = hoursNeeded(mid)
            if hours > h {
                left = mid + 1
            } else {
                right = mid
            }
        }

        return left
    }
}
