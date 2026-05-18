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
        var counter = head
        var length = 0
        while counter != nil {
            length += 1
            counter = counter?.next
        }

        let targetIndex = length - n
        if targetIndex == 0 {
            return head?.next
        }
        var currentIndex = 0
        var dummyHead = ListNode(0)
        dummyHead.next = head
        var current = head
        var prev: ListNode?
        while currentIndex != targetIndex {
            currentIndex += 1
            let next = current?.next
            prev = current
            current = next
        }

        prev?.next = current?.next
        current?.next = nil
        return dummyHead.next
    }
}
