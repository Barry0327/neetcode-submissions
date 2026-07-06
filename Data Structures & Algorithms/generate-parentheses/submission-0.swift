class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        var current = ""

        func backtrack(_ openCount: Int, _ closeCount: Int) {
            if current.count == n * 2 {
                result.append(current)
                return
            }

            if openCount < n {
                current.append("(")
                backtrack(openCount + 1, closeCount)
                current.removeLast()
            }

            if closeCount < openCount {
                current.append(")")
                backtrack(openCount, closeCount + 1)
                current.removeLast()
            }
        }

        backtrack(0, 0)
        return result
    }
}
