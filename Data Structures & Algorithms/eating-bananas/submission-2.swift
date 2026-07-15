class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var left = 1, right = piles.max()!
        while left < right {
            let mid = left + (right - left) / 2
            let hours = hoursNeeded(piles, mid)
            if hours > h {
                left = mid + 1
            } else {
                right = mid
            }
        }

        return left
    }

    func hoursNeeded(_ piles: [Int], _ k: Int) -> Int {
        var hours = 0
        for pile in piles {
            hours += (pile + k - 1) / k
        }
        return hours
    }
}
