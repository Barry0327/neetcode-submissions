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
        var result = [[Int]]()
        var queue = [root]

        while queue.isEmpty == false {
            let length = queue.count
            var currentLevel = [Int]()
            for _ in 0..<length {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
                currentLevel.append(node.val)
            }
            result.append(currentLevel)
        }
        return result
    }
}
