class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var table: [Character: Int] = [:]
        var left = 0
        var result = 0
        let chars = Array(s)

        for right in 0..<s.count {
            if let index = table[chars[right]] {
                left = max(index + 1, left)
            } 
            table[chars[right]] = right
            result = max(result, right - left + 1)
        }

        return result
    }
}
