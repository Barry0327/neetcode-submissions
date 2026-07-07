class Solution {
    func partition(_ s: String) -> [[String]] {
        let chars = Array(s)
        var result = [[String]]()
        var current = [String]()

        func isPalindrome(_ left: Int, _ right: Int) -> Bool {
            var l = left, r = right
            while l < r {
                if chars[l] != chars[r] { return false }
                l += 1
                r -= 1
            }
            return true
        }

        func backtrack(_ start: Int) {
            if start == chars.count {
                result.append(current)
                return
            }

            for end in start..<chars.count {
                if isPalindrome(start, end) {
                    current.append(String(chars[start...end]))
                    backtrack(end + 1)
                    current.removeLast()
                }
            }
        }

        backtrack(0)
        return result
    }
}
