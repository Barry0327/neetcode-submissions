class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }

        let digitToChar: [Character: String] = [
            "2": "abc", "3": "def", "4": "ghi", "5": "jkl",
            "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"
        ]

        let digitArray = Array(digits)
        var result = [String]()
        var current = ""

        func backtrack(_ index: Int) {
            if current.count == digits.count {
                result.append(current)
                return
            }

            if let letters = digitToChar[digitArray[index]] {
                for char in letters {
                    current.append(char)
                    backtrack(index + 1)
                    current.removeLast()
                }
            }
        }

        backtrack(0)
        return result
    }
}