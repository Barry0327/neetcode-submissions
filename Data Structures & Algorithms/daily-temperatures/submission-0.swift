class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var stack = [Int]()
        var result = Array(repeating: 0, count: temperatures.count)

        for (i, temp) in temperatures.enumerated() {
            while let top = stack.last, temperatures[top] < temp {
                result[top] = i - top
                stack.removeLast()
            }

            stack.append(i)
        }
        return result
    }
}
