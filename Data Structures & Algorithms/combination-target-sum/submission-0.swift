class Solution {
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()

        func backtrack(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(current)
                return
            }

            if remaining < 0 {
                return
            }
            for i in start..<nums.count {
                current.append(nums[i])
                backtrack(i, remaining - nums[i])
                current.removeLast()
            }
        }

        backtrack(0, target)
        return result
    }
}
