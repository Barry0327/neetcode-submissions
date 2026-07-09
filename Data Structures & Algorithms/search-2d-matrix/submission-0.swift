class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for nums in matrix {
            if nums[0] <= target, nums[nums.count - 1] >= target {
                if binarySearch(nums, target) {
                    return true
                }
            }
        }

        return false
    }

    func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0, r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target {
                return true
            } else if nums[mid] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return false
    }
}
