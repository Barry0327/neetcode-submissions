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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        var queue = [root]
        var result: [Int] = []

        while !queue.isEmpty {
            let len = queue.count
            var currentLevel: [Int] = []
            for _ in 0..<len {
                let node = queue.removeFirst()
                currentLevel.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            result.append(currentLevel.last!)
        }

        return result
    }
}
