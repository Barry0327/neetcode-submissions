import HeapModule

class Solution {
    struct Point: Comparable {
        let x, y: Int
        var distance: Int {
            (x*x) + (y*y)
        }

        static func < (lhs: Point, rhs: Point) -> Bool {
            return lhs.distance < rhs.distance
        }
    }
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var heap = Heap<Point>()

        for point in points {
            let item = Point(x: point[0], y: point[1])
            heap.insert(item)

            if heap.count > k {
                heap.popMax()
            }
        }

        var result = [[Int]]()

        while heap.isEmpty == false {
            let item = heap.popMin()!
            result.append([item.x, item.y])
        }
        return result
    }
}
