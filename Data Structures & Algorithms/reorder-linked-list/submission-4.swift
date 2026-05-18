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
        var slow = head, fast = head?.next

        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }

        var second = slow?.next
        slow?.next = nil
        var prev: ListNode? = nil

        while second != nil {
            let next = second?.next
            second?.next = prev
            prev = second
            second = next
        }

        var first = head
        second = prev

        while first != nil {
            let firstNext = first?.next
            let secondNext = second?.next
            first?.next = second
            second?.next = firstNext
            first = firstNext
            second = secondNext
        }
    }
}
