class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var result = 0
        var left = 0
        var right = heights.count - 1

        while left < right {
            let width = right - left
            let leftHeight = heights[left]
            let rightHeight = heights[right]
            let height = min(heights[left], heights[right])
            let value = width * height
            result = max(result, value)

            if leftHeight < rightHeight {
                left += 1
            } else {
                right -= 1
            }
        }
        return result
    }
}
