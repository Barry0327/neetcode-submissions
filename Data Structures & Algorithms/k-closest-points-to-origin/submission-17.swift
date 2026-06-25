class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var points = points
        func distance(_ points: [Int]) -> Int {
            return points[0]*points[0] + points[1]*points[1]
        }
        func partition(_ l: Int, _ r: Int) -> Int {
            let pivot = r
            let pivotDist = distance(points[pivot])
            var i = l
            for j in l..<r {
                if distance(points[j]) <= pivotDist {
                    points.swapAt(i, j)
                    i += 1
                }
            }
            points.swapAt(i, pivot)
            return i
        }

        var l = 0, r = points.count - 1
        var pivot = points.count
        while pivot != k {
            pivot = partition(l, r)
            if pivot > k {
                r = pivot - 1
            } else {
                l = pivot + 1
            }
        }

        return Array(points[..<k])
    }
}
