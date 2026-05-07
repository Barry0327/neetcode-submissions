class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var l = 0
        var r = nums.count - 1

        while l < r {
            let mid = (l + r) / 2
            
            if nums[mid] < nums[r] {
                r = mid
            } else {
                l = mid + 1
            }
        }

        return nums[l]
    }
}
