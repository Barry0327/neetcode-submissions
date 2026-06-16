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

        while current != nil {
            let value = current!.val
            if p!.val < value, q!.val < value {
                current = current?.left
            } else if p!.val > value, q!.val > value {
                current = current?.right
            } else {
                return current
            }
        }

        return current
    }
}
