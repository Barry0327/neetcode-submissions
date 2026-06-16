/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result: [[Int]] = []

        func dfs(_ root: TreeNode?, depth: Int) {
            guard let root else { return }

            if result.count == depth {
                result.append([])
            }
            result[depth].append(root.val)
            dfs(root.left, depth: depth + 1)
            dfs(root.right, depth: depth + 1)
        }

        dfs(root, depth: 0)

        return result
    }
}
