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
        var stack = [(p: TreeNode?, q: TreeNode?)]()
        stack = [(p, q)]

        while !stack.isEmpty {
            let (p, q) = stack.removeLast()
            if p == nil, q == nil {
                continue
            }

            if q?.val != p?.val {
                return false
            }

            stack.append((p?.left, q?.left))
            stack.append((p?.right, q?.right))
        }

        return true
    }
}
