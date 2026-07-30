class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        guard nums.isEmpty == false else { return 0 }
        let nums = nums.sorted()
        var result = 1
        var count = 1

        for i in 1..<nums.count {
            if nums[i - 1] == nums[i] {
                continue
            } else if nums[i] == nums[i - 1] + 1 {
                count += 1
            } else {
                count = 1
            }

            result = max(result, count)
        }
        return result
    }
}
