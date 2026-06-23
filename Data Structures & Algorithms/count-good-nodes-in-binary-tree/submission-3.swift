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
    func goodNodes(_ root: TreeNode?) -> Int {
        var result = 0
        func dfs(_ root: TreeNode?, _ maxVal: Int) {
            guard let root else { return }
            if root.val >= maxVal {
                result += 1
            }
            dfs(root.left, max(maxVal, root.val))
            dfs(root.right, max(maxVal, root.val))
        }

        dfs(root, Int.min)
        return result
    }
}
