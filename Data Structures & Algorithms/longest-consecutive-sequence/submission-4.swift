class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var set = Set(nums)
        var result = 0

        for num in set {
            guard set.contains(num - 1) == false else { continue }
            var count = 1
            var offset = 1
            while set.contains(num + offset) {
                count += 1
                offset += 1
            }
            result = max(result, count)
        }

        return result
    }
}
