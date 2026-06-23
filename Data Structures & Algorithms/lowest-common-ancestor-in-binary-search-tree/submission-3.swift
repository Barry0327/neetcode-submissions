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
        var current = root

        while let node = current {
            if p!.val > node.val, q!.val > node.val {
                current = node.right
            } else if p!.val < node.val, q!.val < node.val {
                current = node.left
            } else {
                return node
            }
        }

        return current
    }
}
