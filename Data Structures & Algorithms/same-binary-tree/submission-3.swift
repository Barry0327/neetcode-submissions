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
            let (nodeP, nodeQ) = stack.removeLast()
            if nodeP == nil , nodeQ == nil {
                continue
            }

            if nodeP?.val != nodeQ?.val {
                return false
            }
            stack.append((nodeP?.right, nodeQ?.right))
            stack.append((nodeP?.left, nodeQ?.left))
        }

        return true
    }
}
