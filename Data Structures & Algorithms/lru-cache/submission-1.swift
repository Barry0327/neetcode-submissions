class LRUCache {
    private let capacity: Int
    private var cache: [Int: ListNode] = [:]
    private var left = ListNode(0, 0)
    private var right = ListNode(0 ,0)

    init(_ capacity: Int) {
        self.capacity = capacity
        self.left.next = right
        self.right.prev = left
    }

    private func remove(_ node: ListNode) {
        let prev = node.prev
        let next = node.next
        prev?.next = next
        next?.prev = prev
    }

    private func append(_ node: ListNode) {
        let prev = right.prev
        node.prev = prev
        prev?.next = node
        node.next = right
        right.prev = node
    }

    func get(_ key: Int) -> Int {
        if let node = cache[key] {
            remove(node)
            append(node)
            return node.value
        }

        return -1
    }

    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            remove(node)
        }

        let newNode = ListNode(key, value)
        cache[key] = newNode
        append(newNode)

        if cache.count > capacity, let node = left.next {
            remove(node)
            cache.removeValue(forKey: node.key)
        }
    }
}

class ListNode {
    let key: Int
    let value: Int
    var next: ListNode?
    var prev: ListNode?

    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value
    }
}
