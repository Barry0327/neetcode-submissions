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
        var pList: [Int?] = []
        var qList: [Int?] = []

        dfs(p, travelThrough: { node in pList.append(node?.val) })
        dfs(q, travelThrough: { node in qList.append(node?.val) })

        return pList == qList
    }

    private func dfs(_ root: TreeNode?, travelThrough: @escaping (TreeNode?) -> Void) {
        guard root != nil else {
            travelThrough(nil)
            return
        }
        dfs(root?.left, travelThrough: travelThrough)
        dfs(root?.right, travelThrough: travelThrough)
        travelThrough(root)
    }
}
