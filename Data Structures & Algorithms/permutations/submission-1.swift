class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        var used = Array(repeating: false, count: nums.count)

        func backtrack() {
            if current.count == nums.count {
                result.append(current)
                return
            }

            for i in 0..<nums.count {
                if used[i] { continue }
                current.append(nums[i])
                used[i] = true
                backtrack()
                current.removeLast()
                used[i] = false
            }
        }
        backtrack()
        return result
    }
}
