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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1 = list1
        var list2 = list2
        var dummy = ListNode(0)
        var prev: ListNode? = dummy

        while list1 != nil && list2 != nil {
            if list1!.val <= list2!.val {
                prev?.next = list1
                prev = list1
                list1 = list1?.next
            } else {
                prev?.next = list2
                prev = list2
                list2 = list2?.next
            }
        }

        if let list1 {
            prev?.next = list1
        }

        if let list2 {
            prev?.next = list2
        }

        return dummy.next
    }
}
