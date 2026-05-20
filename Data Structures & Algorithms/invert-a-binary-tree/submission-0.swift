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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root else { return nil }
        var queue = [root]

        while queue.isEmpty == false {
            let node = queue.removeFirst()
            let left = node.left
            let right = node.right
            node.left = right
            node.right = left

            if let left = node.left {
                queue.append(left)
            }

            if let right = node.right {
                queue.append(right)
            }
        }

        return root
    }
}
