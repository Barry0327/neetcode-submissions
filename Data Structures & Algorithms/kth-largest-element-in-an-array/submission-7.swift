class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        let targetIndex = nums.count - k

        func partition(_ l: Int, _ r: Int) -> Int {
            let pivot = r
            var i = l
            for j in l..<r {
                if nums[j] <= nums[pivot] {
                    nums.swapAt(i, j)
                    i += 1
                }
            }
            nums.swapAt(pivot, i)
            return i
        }

        var l = 0, r = nums.count - 1
        var pivot = nums.count
        while pivot != targetIndex {
            pivot = partition(l, r)
            if pivot < targetIndex {
                l = pivot + 1
            } else if pivot > targetIndex {
                r = pivot - 1
            }
        }

        return nums[pivot]
        
    }
}
