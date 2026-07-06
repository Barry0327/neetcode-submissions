class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()

        func backtrack(_ index: Int) {
            if index == nums.count {
                result.append(current)
                return
            }

            backtrack(index + 1)
            current.append(nums[index])
            backtrack(index + 1)
            current.removeLast()
        }

        backtrack(0)
        return result
    }
}
