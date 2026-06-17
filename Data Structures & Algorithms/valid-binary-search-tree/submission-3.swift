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
        return isBST(root, maxVal: nil, minVal: nil)
    }

    func isBST(_ root: TreeNode?, maxVal: Int?, minVal: Int?) -> Bool {
        guard let root else { return true }
        if let maxVal, root.val >= maxVal {
            return false
        }

        if let minVal, root.val <= minVal {
            return false
        }

        return isBST(root.left, maxVal: min(maxVal ?? Int.max, root.val), minVal: minVal) && isBST(root.right, maxVal: maxVal, minVal: max(minVal ?? Int.min, root.val))
    }
}
