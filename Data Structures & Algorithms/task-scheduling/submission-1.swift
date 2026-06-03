import HeapModule
import DequeModule

class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var counts = [Character: Int]()
        for task in tasks { counts[task, default: 0] += 1 }

        var heap = Heap(Array(counts.values))

        var cooling = Deque<(count: Int, readyAt: Int)>()

        var times = 0

        while !heap.isEmpty || !cooling.isEmpty {
            times += 1

            if heap.isEmpty {
                times = cooling.first!.readyAt
            } else {
                let left = heap.popMax()! - 1
                if left > 0 {
                    cooling.append((left, times + n))
                }
            }

            if let front = cooling.first, front.readyAt == times {
                heap.insert(front.count)
                cooling.removeFirst()
            }
        }

        return times
    }
}
