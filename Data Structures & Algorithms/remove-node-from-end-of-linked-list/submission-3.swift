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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var n = n
        var fast = head

        while n > 1 {
            fast = fast?.next
            n -= 1
        }

        var dummy = ListNode(0)
        dummy.next = head
        var slow: ListNode? = dummy

        while let fastNext = fast?.next {
            fast = fastNext
            slow = slow?.next
        }

        slow?.next = slow?.next?.next
        return dummy.next
    }
}
