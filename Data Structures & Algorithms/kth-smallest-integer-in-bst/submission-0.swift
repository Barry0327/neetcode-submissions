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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var index = 0
        var result = 0

        func inOrder(_ root: TreeNode?) {
            guard let root else { return }
            inOrder(root.left)
            index += 1
            if index == k {
                result = root.val
                return
            }
            inOrder(root.right)
        }

        inOrder(root)
        return result
    }
}
