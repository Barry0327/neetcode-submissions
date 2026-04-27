class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var result = 0
        for i in 0..<heights.count {
            for j in (i + 1)..<heights.count {
                let width = j - i
                let height = min(heights[i], heights[j])
                result = max(result, width * height)
            }
        }

        return result
    }
}
