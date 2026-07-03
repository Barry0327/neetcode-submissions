class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var current = [Int]()
        var candidates = candidates.sorted()

        func backtrack(_ start: Int, _ remaining: Int) {
            if remaining == 0 {
                result.append(current)
                return
            }

            if remaining < 0 {
                return
            }

            for i in start..<candidates.count {
                if i > 0, i - 1 >= start, candidates[i - 1] == candidates[i] {
                    continue
                }
                current.append(candidates[i])
                backtrack(i + 1, remaining - candidates[i])
                current.removeLast()
            }
        }
        backtrack(0, target)
        return result
    }
}
