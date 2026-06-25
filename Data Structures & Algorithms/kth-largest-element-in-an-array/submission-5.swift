class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let targetIndex = nums.count - k

        func quickSelect(_ l: Int, _ r: Int) -> Int {
            let pivot = r
            var i = l
            for j in l..<r {
                if nums[j] <= nums[pivot] {
                    nums.swapAt(i, j)
                    i += 1
                }
            }
            nums.swapAt(i, pivot)
            if targetIndex == i {
                return nums[i]
            } else if i < targetIndex {
                return quickSelect(i + 1, r)
            } else {
                return quickSelect(l, i - 1)
            }
        }

        return quickSelect(0, nums.count - 1)
    }
}
