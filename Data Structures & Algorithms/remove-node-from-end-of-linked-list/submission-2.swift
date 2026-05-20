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
        var length = 0
        var counter = head
        while counter != nil {
            counter = counter?.next
            length += 1
        }

        var targetIndex = length - n
        if targetIndex == 0 {
            return head?.next
        }

        var dummy = ListNode(0)
        dummy.next = head

        var current = head
        while targetIndex > 1 {
            current = current?.next
            targetIndex -= 1
        }
        current?.next = current?.next?.next
        return dummy.next
    }
}
