class LRUCache {
    private let capacity: Int
    private var dict = [Int: ListNode]()
    private var left: ListNode
    private var right: ListNode

    init(_ capacity: Int) {
        self.capacity = capacity
        self.left = ListNode(0, 0)
        self.right = ListNode(0, 0)
        left.next = right
        right.prev = left
    }

    private func insert(_ node: ListNode) {
        let next = left.next
        left.next = node
        node.prev = left
        node.next = next
        next?.prev = node
    }

    private func removeNode(_ node: ListNode?) {
        let prev = node?.prev
        let next = node?.next
        prev?.next = next
        next?.prev = prev
    }

    func get(_ key: Int) -> Int {
        guard let node = dict[key] else {
            return -1
        }
        removeNode(node)
        insert(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {
        if let node = dict[key] {
            removeNode(node)
        }

        let newNode = ListNode(key, value)
        dict[key] = newNode
        insert(newNode)

        if dict.count > capacity, let node = right.prev {
            removeNode(node)
            dict.removeValue(forKey: node.key)
        }
    }
}

class ListNode {
    let key: Int
    let val: Int
    var next: ListNode?
    var prev: ListNode?

    init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
    }
}