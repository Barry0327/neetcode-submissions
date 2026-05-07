class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1

        while l <= r {
            let mid = (l + r) / 2
            let midNum = nums[mid]
            if midNum == target { return mid }

            if midNum <= nums[r] {
                if midNum < target, nums[r] >= target {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            } else {
                if nums[l] <= target, midNum > target {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
        }

        return -1
    }
}
