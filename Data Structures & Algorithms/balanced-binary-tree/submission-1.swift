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
    func isBalanced(_ root: TreeNode?) -> Bool {
        var isBalanced = true
        func height(_ root: TreeNode?) -> Int {
            guard let root else { return 0 }
            let left = height(root.left)
            let right = height(root.right)
            if abs(right - left) > 1 {
                isBalanced = false
            }
            return 1 + max(left, right) 
        }

        _ = height(root)
        return isBalanced
    }


}
