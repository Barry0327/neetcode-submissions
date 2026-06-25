class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        let countTable = tasks.reduce(into: [Character: Int]()) { result, next in
            result[next, default: 0] += 1
        }
        var maxHeap = MaxHeap()
        countTable.values.forEach {
            maxHeap.insert($0)
        }

        var times = 0
        while maxHeap.isEmpty == false {
            var cooling = [Int]()
            var cycles = 0
            for _ in 0...n {
                if let count = maxHeap.pop() {
                    if (count - 1) > 0 { cooling.append(count - 1) }
                    cycles += 1
                }
            }
            cooling.forEach { maxHeap.insert($0) }
            times += maxHeap.isEmpty ? cycles : (n + 1)
        }
        return times
    }
}

struct MaxHeap {
    private var data: [Int] = []

    var isEmpty: Bool {
        return data.isEmpty
    }

    mutating func pop() -> Int? {
        guard isEmpty == false else { return nil }
        let max = data[0]
        data[0] = data[data.count - 1]
        data.removeLast()
        var i = 0
        while true {
            let l = (i * 2) + 1
            let r = (i * 2) + 1
            var candidate = i
            if l < data.count && data[l] > data[candidate] { candidate = l }
            if r < data.count && data[r] > data[candidate] { candidate = r }
            if candidate == i {
                break
            }
            data.swapAt(candidate, i)
            i = candidate
        }
        return max
    }

    mutating func insert(_ num: Int) {
        data.append(num)
        var i = data.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if data[i] <= data[parent] { break }
            data.swapAt(i, parent)
            i = parent
        }
    }


}