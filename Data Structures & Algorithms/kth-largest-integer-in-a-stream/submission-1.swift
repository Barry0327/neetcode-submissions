import HeapModule

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
