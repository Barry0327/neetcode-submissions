class Solution {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var heap = Heap(stones)
        while heap.count > 1 {
            let stone1 = heap.popMax()!
            let stone2 = heap.popMax()!
            let remain = stone1 - stone2
            if remain > 0 {
                heap.insert(remain)
            }
        }

        return heap.popMax() ?? 0
    }
}

struct Heap {
    private var elements: [Int]

    init(_ elements: [Int]) {
        self.elements = elements
        guard elements.isEmpty == false else { return }
        for i in stride(from: (elements.count / 2) - 1, through: 0, by: -1) {
            siftDown(at: i)
        }
    }

    private func leftChild(ofParent index: Int) -> Int {
        return (index * 2) + 1
    }

    private func rightChild(ofParent index: Int) -> Int {
        return (index * 2) + 2
    }

    private func parentIndex(ofChild index: Int) -> Int {
        return (index - 1) / 2
    }

    var count: Int {
        elements.count
    }

    var isEmpty: Bool {
        elements.isEmpty
    }

    var max: Int? {
        return elements.first
    }

    mutating func popMax() -> Int? {
        guard isEmpty == false else { return nil }
        elements.swapAt(0, count - 1)
        defer {
            siftDown(at: 0)
        }
        return elements.removeLast()
    }

    mutating private func siftDown(at index: Int) {
        var parent = index
        while true {
            let left = leftChild(ofParent: parent)
            let right = rightChild(ofParent: parent)
            var candidate = parent
            if left < count, elements[left] > elements[candidate] {
                candidate = left
            }
            if right < count, elements[right] > elements[candidate] {
                candidate = right
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }

    mutating func insert(_ element: Int) {
        elements.append(element)
        siftUp(at: count - 1)
    }

    mutating private func siftUp(at index: Int) {
        var child = index
        var parent = parentIndex(ofChild: child)

        while child > 0, elements[child] > elements[parent] {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChild: child)
        }
    }
}
