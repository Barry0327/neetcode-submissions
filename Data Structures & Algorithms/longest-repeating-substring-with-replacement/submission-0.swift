class Solution {
    func characterReplacement(_ s: String, _ k: Int) -> Int {
            let chars = Array(s)
            var result = 0
            
            for i in 0..<chars.count {
                var table = [Character: Int]()
                table[chars[i], default: 0] += 1
                var maxFreq = 1
                for j in i + 1..<chars.count {
                    table[chars[j], default: 0] += 1
                    maxFreq = max(maxFreq, table[chars[j]]!)
                    let length = j - i + 1
                    if (length - maxFreq) <= k {
                        result = max(result, length)
                    }
                }
            }

            return result
    }
}
