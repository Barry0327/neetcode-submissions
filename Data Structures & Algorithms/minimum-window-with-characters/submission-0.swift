class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        guard s.isEmpty == false else { return "" }
        let sArray = Array(s)
        let tCountTable: [Character: Int] = t.reduce(into: [:]) { result, c in
            result[c, default: 0] += 1
        }
        var sCountTable: [Character: Int] = [:]
        var left = 0, have = 0, need = tCountTable.count
        var result = [-1, -1]
        var resultLength = Int.max

        for right in 0..<sArray.count {
            let c = sArray[right] 
            sCountTable[c, default: 0] += 1

            if sCountTable[c] == tCountTable[c] {
                have += 1
            }

            while have == need {
                if (right - left + 1) < resultLength {
                    result = [left, right]
                    resultLength = right - left + 1
                }
                let leftC = sArray[left]
                sCountTable[leftC, default: 0] -= 1

                if let count = tCountTable[leftC], sCountTable[leftC, default: 0] < count {
                    have -= 1
                }

                left += 1
            }
        }

        let (l, r) = (result[0], result[1])
        return resultLength != Int.max ? String(sArray[l...r]) : ""
    }
}
