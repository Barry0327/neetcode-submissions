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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root else { return [] }
        var queue = [root]
        var childQueue = [TreeNode]()
        var currentLevel: [Int] = []
        var result: [[Int]] = []

        while !queue.isEmpty {
            let node = queue.removeFirst()
            currentLevel.append(node.val)
            if let left = node.left {
                childQueue.append(left)
            }

            if let right = node.right {
                childQueue.append(right)
            }

            if queue.isEmpty {
                result.append(currentLevel)
                currentLevel = []
                queue = childQueue
                childQueue = []
            }
        }

        return result
    }
}
