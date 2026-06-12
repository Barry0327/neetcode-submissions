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
    func isBalanced(_ root: TreeNode?) -> Bool {
        var result = true
        func dfs(_ root: TreeNode?) -> Int {
            guard let root else { return 0 }
            let left = dfs(root.left)
            let right = dfs(root.right)
            if abs(left - right) > 1 {
                result = false
            }
            return 1 + max(left, right)
        }

        dfs(root)

        return result
    }
}
