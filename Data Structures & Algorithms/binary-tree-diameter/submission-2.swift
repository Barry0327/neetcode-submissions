/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var stack: [TreeNode] = [root]
        var mp = [ObjectIdentifier: (Int, Int)]()

        while !stack.isEmpty {
            let node = stack.last!
            if let left = node.left, mp[ObjectIdentifier(left)] == nil {
                stack.append(left)
            } else if let right = node.right, mp[ObjectIdentifier(right)] == nil {
                stack.append(right)
            } else {
                let node = stack.removeLast()
                let leftTuple = node.left != nil ? mp[ObjectIdentifier(node.left!)]! : (0, 0)
                let rightTuple = node.right != nil ? mp[ObjectIdentifier(node.right!)]! : (0, 0)
                let height = 1 + max(leftTuple.0, rightTuple.0)
                let diameter = max(leftTuple.0 + rightTuple.0, leftTuple.1, rightTuple.1)
                mp[ObjectIdentifier(node)] = (height, diameter)
            }
        }

        return mp[ObjectIdentifier(root)]!.1
    }
}