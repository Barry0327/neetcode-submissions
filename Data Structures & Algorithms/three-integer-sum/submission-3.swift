class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()

        for i in 0..<nums.count {
            if i > 0, nums[i] == nums[i - 1] { continue }
            var left = i + 1
            var right = nums.count - 1

            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    while left < right, nums[left + 1] == nums[left] {
                        left += 1
                    }
                    while left < right, nums[right - 1] == nums[right] {
                        right -= 1
                    }
                    left += 1
                    right -= 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return result
    }
}
