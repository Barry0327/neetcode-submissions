class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let array = Array(s)
        var left = 0
        var right = s.count - 1

        while left < right {
            while left < right && !isAlphaNum(array[left]) {
                left += 1
            }

            while left < right && !isAlphaNum(array[right]) {
                right -= 1
            }

            if array[left].lowercased() != array[right].lowercased() {
                return false
            } else {
                left += 1
                right -= 1
            }
        }
        return true
    }

    private func isAlphaNum(_ c: Character) -> Bool {
        return c.isLetter || c.isNumber
    }
}
