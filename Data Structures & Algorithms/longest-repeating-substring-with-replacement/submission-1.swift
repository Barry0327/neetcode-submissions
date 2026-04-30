class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
            let chars = Array(s)
            var result = 0
            var left = 0
            var maxFreq = 0
            var table: [Character: Int] = [:]
            
            for right in 0..<chars.count {
                table[chars[right], default: 0] += 1
                maxFreq = max(maxFreq, table[chars[right]]!)
                while (right - left + 1) > (maxFreq + k) {
                    table[chars[left], default: 0] -= 1
                    left += 1
                }
                let length = right - left + 1
                result = max(length, result)
            }

            return result
    }
}
