class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        var used = Array(repeating: false, count: nums.count)
        var nums = nums.sorted()

        func backtrack(_ index: Int) {
            if index == nums.count {
                result.append(current)
                return
            }

            backtrack(index + 1)
            if index > 0, used[index - 1] == false, nums[index] == nums[index - 1] {
                return
            }
            current.append(nums[index])
            used[index] = true
            backtrack(index + 1)
            current.removeLast()
            used[index] = false
        }

        backtrack(0)
        return result
    }
}
