class Solution {
    func isValid(_ s: String) -> Bool {
        let table: [Character: Character] = [
            "}": "{",
            ")": "(",
            "]": "["
        ]
        var stack = [Character]()

        for c in s {
            if let open = table[c] {
                if stack.last == open {
                    stack.popLast()
                } else {
                    return false
                }
            } else {
                stack.append(c)
            }
        }

        return stack.isEmpty
    }
}
