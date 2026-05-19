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
        var dummyHead = ListNode(0)
        dummyHead.next = head
        var right = head
        var n = n

        while n > 1 {
            n -= 1
            right = right?.next
        }

        var left: ListNode? = dummyHead

        while right?.next != nil {
            right = right?.next
            left = left?.next
        }

        left?.next = left?.next?.next
        return dummyHead.next
    }
}
