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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        func dfs(_ root: TreeNode?) -> [Int?] {
            guard let root else { return [nil] }
            let left = dfs(root.left)
            let right = dfs(root.right)
            return [root.val] + left + right
        }

        let pList = dfs(p)
        let qList = dfs(q)
        return pList == qList
    }
}
