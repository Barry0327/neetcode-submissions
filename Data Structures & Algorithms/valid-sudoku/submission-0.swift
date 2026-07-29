class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = Array(repeating: Set<Character>(), count: 9)
        var cols = Array(repeating: Set<Character>(), count: 9)
        var boxes = Array(repeating: Set<Character>(), count: 9)

        for row in 0..<9 {
            for col in 0..<9 {
                let c = board[row][col]
                if c == "." { continue}
                let box = (row / 3) * 3 + (col / 3)
                if rows[row].contains(c) || cols[col].contains(c) || boxes[box].contains(c) {
                    return false
                }
                rows[row].insert(c)
                cols[col].insert(c)
                boxes[box].insert(c)
            }
        }

        return true
    }
}
