
class KthLargest {
    private var heap: Heap<Int> = .init()
    private let k: Int

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        for num in nums {
            heap.insert(num)
            if heap.count > k {
                heap.popMin()
            }
        }
    }

    func add(_ val: Int) -> Int {
        heap.insert(val)
        if heap.count > k {
            heap.popMin()
        }
        return heap.min!
    }
}

struct Heap<Element: Comparable> {
    private var elements: [Element]
    
    init(_ elements: [Element] = []) {
        self.elements = elements
        for i in stride(from: (elements.count - 1) / 2, through: 0, by: -1) {
            siftDown(from: i)
        }
    }

    var count: Int {
        elements.count
    }

    var min: Element? {
        elements.first
    }

    @discardableResult
    mutating func popMin() -> Element? {
        guard elements.isEmpty == false else { return nil }
        elements.swapAt(0, elements.count - 1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }

    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }

    private func leftChildIndex(from parent: Int) -> Int {
        (parent * 2) + 1
    }

    private func rightChildIndex(from parent: Int) -> Int {
        (parent * 2) + 2
    }

    private func parentIndex(from child: Int) -> Int {
        (child - 1) / 2
    }

    mutating private func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(from: child)
        while child > 0, elements[child] < elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(from: child)
        }
    }

    mutating private func siftDown(from index: Int) {
        var parent = index
        while true {
            let leftChild = leftChildIndex(from: parent)
            let rightChild = rightChildIndex(from: parent)
            var candidate = parent
            if leftChild < count, elements[candidate] > elements[leftChild] {
                candidate = leftChild
            }
            if rightChild < count, elements[rightChild] < elements[candidate] {
                candidate = rightChild
            }
            if candidate == parent {
                return
            }
            elements.swapAt(candidate, parent)
            parent = candidate
        }
    }
}
