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
    func isValidBST(_ root: TreeNode?) -> Bool {

        func isBST(_ root: TreeNode?, max: Int, min: Int) -> Bool {
            guard let root else { return true }
            if root.val >= max {
                return false
            }
            if root.val <= min {
                return false
            }

            return isBST(root.left, max: root.val, min: min) &&
                isBST(root.right, max: max, min: root.val)
        }

        return isBST(root, max: Int.max, min: Int.min)
    }
}
