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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {

        var result = 0
        func dfs(_ node: TreeNode?) -> Int {
            guard let node else { return 0 }
            let left = dfs(node.left)
            let right = dfs(node.right)
            result = max(result, left + right)
            return 1 + max(left, right)
        }

        dfs(root)
        return result
    }
}
