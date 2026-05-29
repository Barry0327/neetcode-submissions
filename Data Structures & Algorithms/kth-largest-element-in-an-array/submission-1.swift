
class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let targetIndex = nums.count - k

        func quickSelect(left: Int, right: Int) -> Int {
            let pivot = nums[right]
            var i = left

            for j in left..<right {
                if nums[j] <= pivot {
                    nums.swapAt(i, j)
                    i += 1
                }
            }
            nums.swapAt(i, right)

            if i > targetIndex {
                return quickSelect(left: left, right: i - 1)
            } else if i < targetIndex {
                return quickSelect(left: i + 1, right: right)
            } else {
                return nums[i]
            }
        }

        return quickSelect(left: 0, right: nums.count - 1)
    }
}
