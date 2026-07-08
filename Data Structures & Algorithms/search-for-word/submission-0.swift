class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let word = Array(word)
        let rows = board.count, cols = board[0].count
        let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        func backtrack(_ row: Int, _ col: Int, _ index: Int) -> Bool {
            if index == word.count - 1 {
                return true
            }

            let temp = board[row][col]
            board[row][col] = "#"

            for dir in directions {
                let newRow = row + dir.0, newCol = col + dir.1
                if newRow < 0 || newRow == rows || newCol < 0 || newCol == cols {
                    continue
                }
                if board[newRow][newCol] == "#" || board[newRow][newCol] != word[index + 1] {
                    continue
                }
                
                if backtrack(newRow, newCol, index + 1) {
                    board[row][col] = temp
                    return true
                }
            }

            board[row][col] = temp
            return false
        }

        for row in 0..<rows {
            for col in 0..<cols {
                if board[row][col] == word[0], backtrack(row, col, 0) {
                    return true
                } 
            }
        }

        return false
    }
}
