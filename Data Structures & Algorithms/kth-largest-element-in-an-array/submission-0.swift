import HeapModule

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap(nums)
        var k = k
        var result = 0
        while k > 0, heap.isEmpty == false {
            result = heap.popMax()!
            k -= 1
        }
        return result
    }
}
