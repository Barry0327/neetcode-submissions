class KthLargest {
    let k: Int
    var array: [Int]

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.array = nums
    }

    func add(_ val: Int) -> Int {
        array.append(val)
        array.sort()
        return array[array.count - k]
    }
}
