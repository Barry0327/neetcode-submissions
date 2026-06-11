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
    var map = [ObjectIdentifier: Int]()

    func isBalanced(_ root: TreeNode?) -> Bool {
        var stack = [TreeNode]()
        var current = root
        var lastVisitNode: TreeNode?
        
        while !stack.isEmpty || current != nil {
            while let node = current {
                stack.append(node)
                current = node.left
            }

            let node = stack.last!

            if let right = node.right, lastVisitNode !== right {
                stack.append(right)
                current = right
                continue
            }

            let left = height(node.left)
            let right = height(node.right)

            if abs(left - right) > 1 {
                return false
            }

            map[ObjectIdentifier(node)] = 1 + max(left, right)
            stack.removeLast()
            lastVisitNode = node
        }
        return true

    }

    func height(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }
        return map[ObjectIdentifier(node)] ?? 0
    }
}
