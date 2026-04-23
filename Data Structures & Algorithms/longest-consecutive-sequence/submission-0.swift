class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set(nums)
        var result = 0
        for num in nums {
            if !set.contains(num - 1) {
                var count = 1
                var offset = 1
                while set.contains(num + offset) {
                    offset += 1
                    count += 1
                }

                result = max(count, result)
            }
        }

        return result
    }
}
