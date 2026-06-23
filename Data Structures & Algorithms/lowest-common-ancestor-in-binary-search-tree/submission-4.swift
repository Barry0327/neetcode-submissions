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
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root else { return nil }

        if p!.val > root.val, q!.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        } else if p!.val < root.val, q!.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        } else {
            return root
        }
    }
}
