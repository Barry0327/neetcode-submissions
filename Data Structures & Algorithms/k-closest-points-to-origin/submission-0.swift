import HeapModule

class Solution {
    struct Item: Comparable {
        let x: Int
        let y: Int
        let dist: Int

        init(x: Int, y: Int) {
            self.x = x
            self.y = y
            dist = (x*x) + (y*y)
        }
        
        static func <(lhs: Item, rhs: Item) -> Bool {
            return lhs.dist < rhs.dist
        }
    }

    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap: Heap<Item> = .init()

        for point in points {
            let item = Item(x: point[0], y: point[1])
            heap.insert(item)
        }
        var k = k
        var result: [[Int]] = []
        while heap.isEmpty == false, k > 0 {
            let item = heap.popMin()!
            result.append([item.x, item.y])
            k -= 1
        }

        return result
    }
}
