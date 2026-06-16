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
        var result: Int = 0
        func dfs(_ root: TreeNode?, maxNum: Int) {
            guard let root else { return }
            if root.val >= maxNum {
                result += 1
            }
            let newMax = max(maxNum, root.val)
            dfs(root.left, maxNum: newMax)
            dfs(root.right, maxNum: newMax)
        }

        dfs(root, maxNum: Int.min)
        return result
    }
}
