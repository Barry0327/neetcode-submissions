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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var indexTable = [Int: Int]()
        for i in 0..<inorder.count {
            indexTable[inorder[i]] = i
        }

        var preIndex = 0

        func build(_ left: Int, _ right: Int) -> TreeNode? {
            guard left <= right else { return nil }
            let rootValue = preorder[preIndex]
            preIndex += 1
            let root = TreeNode(rootValue)

            guard let mid = indexTable[rootValue] else { return root }
            root.left = build(left, mid - 1)
            root.right = build(mid + 1, right)

            return root
        }

        return build(0, preorder.count - 1)
    }
}
