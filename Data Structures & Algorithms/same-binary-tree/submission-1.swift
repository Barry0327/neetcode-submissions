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
        var stack = [(p, q)]

        while stack.isEmpty == false {
            // do sth
            let (pNode, qNode) = stack.removeLast()
            if pNode == nil, qNode == nil {
                continue
            }

            if pNode?.val != qNode?.val {
                return false
            }
            stack.append((pNode?.right, qNode?.right))
            stack.append((pNode?.left, qNode?.left))
        }

        return true
    }
}
