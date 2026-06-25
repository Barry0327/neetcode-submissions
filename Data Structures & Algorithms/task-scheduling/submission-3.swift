class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var countDict = [Character: Int]()
        tasks.forEach { task in
            countDict[task, default: 0] += 1
        }
        let maxFreq = countDict.values.max()!
        let maxFreqCount: Int = countDict.reduce(into: 0) { result, next in
            if next.value == maxFreq {
                result += 1
            }
        }
        let times = (n + 1) * (maxFreq - 1) + maxFreqCount
        return max(times, tasks.count)
    }
}
