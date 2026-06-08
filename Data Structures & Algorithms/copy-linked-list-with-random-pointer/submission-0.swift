/*
// Definition for a Node.
class Node {
    var val: Int
    var next: Node?
    var random: Node?
    init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}
*/

class Solution {
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else { return nil }

        var l1 = head
        while l1 != nil {
            let copy = Node(l1!.val)
            copy.next = l1?.next
            l1?.next = copy
            l1 = copy.next
        }

        let newHead = head?.next
        l1 = head

        while l1 != nil {
            let l2 = l1?.next
            if let random = l1?.random {
                l2?.random = random.next
            }
            l1 = l1?.next?.next
        }

        l1 = head
        while l1 != nil {
            let l2 = l1?.next
            l1?.next = l2?.next
            l2?.next = l2?.next?.next
            l1 = l1?.next
        }

        return newHead
    }
}
