class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()

        func backtrace(_ index: Int) {
            if index == nums.count {
                result.append(current)
                return
            }
            backtrace(index + 1)
            current.append(nums[index])
            backtrace(index + 1)
            current.removeLast()
        }
        backtrace(0)
        return result
    }
}
