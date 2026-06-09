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
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy = ListNode(0)
        var current: ListNode? = dummy
        var l1 = l1, l2 = l2
        var carry = 0

        while l1 != nil || l2 != nil || carry != 0 {
            let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
            carry = sum / 10
            let val = sum % 10
            current?.next = ListNode(val)
            current = current?.next
            l1 = l1?.next
            l2 = l2?.next
        }

        return dummy.next
    }
}
