/**
 * Definition for singly-linked list.
 * class ListNode {
 *     var val: Int
 *     var next: ListNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func reorderList(_ head: ListNode?) {
        if head == nil {
            return
        }

        var nodes = [ListNode]()
        var current = head

        while current != nil {
            nodes.append(current!)
            current = current?.next
        }

        var i = 0, j = nodes.count - 1

        while i < j {
            nodes[i].next = nodes[j]
            i += 1
            if i >= j {
                break
            }
            nodes[j].next = nodes[i]
            j -= 1
        }

        nodes[i].next = nil
    }
}
