class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rows = matrix.count
        let cols = matrix[0].count

        var l = 0, r = rows * cols - 1
        while l <= r {
            let mid = l + (r - l) / 2
            let row = mid / cols
            let col = mid % cols

            if matrix[row][col] == target {
                return true
            } else if matrix[row][col] < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }

        return false
    }
}
