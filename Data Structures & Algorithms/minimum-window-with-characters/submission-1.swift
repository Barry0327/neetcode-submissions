class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let tCountTable = t.reduce(into: [:]) { current, character in
            current[character, default: 0] += 1
        }
        var sArray = Array(s)
        var left = 0
        var have = 0
        let need = tCountTable.count
        var sCountTable = [Character: Int]()
        var length = Int.max
        var result = [-1, -1]

        for right in 0..<sArray.count {
            let char = sArray[right]
            sCountTable[char, default: 0] += 1

            if tCountTable[char] == sCountTable[char] {
                have += 1
            }

            while have == need {
                let leftChar = sArray[left]
                let currentLength = right - left + 1

                if currentLength < length {
                    result = [left, right]
                    length = currentLength
                }
                sCountTable[leftChar, default: 0] -= 1
                if let count = sCountTable[leftChar], count < tCountTable[leftChar, default: 0] {
                    have -= 1
                }
                left += 1
            }
        }
        let (l, r) = (result[0], result[1])
        return length == Int.max ? "" : String(sArray[l...r])
    }
}
