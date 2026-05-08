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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var previous: ListNode? = nil
        var current = head

        while current != nil {
            let next = current?.next
            current?.next = previous
            previous = current
            current = next
        }

        return previous
    }
}
