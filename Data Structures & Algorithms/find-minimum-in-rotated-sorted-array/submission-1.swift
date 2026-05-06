class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        var result = Int.max

        while left <= right {
            let mid = (left + right) / 2
            let ln = nums[left]
            let rn = nums[right]
            let midn = nums[mid]

            if ln < rn {
                result = min(ln, result)
                return result
            }

            result = min(midn, result)

            if midn >= ln {
                left = mid + 1
            } else {
                right = mid - 1 
            }
        }

        return result
    }
}
