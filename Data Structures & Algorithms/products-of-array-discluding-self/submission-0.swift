class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let count = nums.count
        var result = [Int](repeating: 1, count: count)

        var prefix = 1
        for i in 0..<count {
            result[i] = prefix
            prefix *= nums[i]
        }

        var suffix = 1
        for i in stride(from: count - 1, through: 0, by: -1) {
            result[i] *= suffix
            suffix *= nums[i]
        }

        return result
    }
}
