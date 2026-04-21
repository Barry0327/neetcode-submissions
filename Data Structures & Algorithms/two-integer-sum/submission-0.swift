class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: [Int]]()

        for index in 0..<nums.count {
            let current = nums[index]
            if let indices = dict[target - current] {
                return [indices.first!, index]
            }
            dict[current, default: []].append(index)
        }

        return []
    }
}
