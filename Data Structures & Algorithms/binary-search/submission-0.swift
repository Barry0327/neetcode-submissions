class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            let midNum = nums[mid]
            if midNum == target {
                return mid
            } else if midNum > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        return -1
    }
}
