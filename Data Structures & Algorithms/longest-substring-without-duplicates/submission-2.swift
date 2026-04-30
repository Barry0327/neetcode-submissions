class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var table: [Character: Int] = [:]
        var result = 0, left = 0
        let chars = Array(s)

        for right in 0..<chars.count {
            if let index = table[chars[right]] {
                left = max(index + 1, left)
            }
            result = max(result, right - left + 1)
            table[chars[right]] = right
        }

        return result
    }
}
