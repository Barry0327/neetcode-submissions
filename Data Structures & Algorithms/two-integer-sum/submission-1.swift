class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for i in 0..<nums.count {
            let num = nums[i]
            if let j = dict[target - num] {
                return [j, i]
            }
            dict[num] = i
        }

        return []
    }
}
