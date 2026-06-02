class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var remains = [Character: Int]()
        for task in tasks {
            remains[task, default: 0] += 1
        }

        var times = 0

        var history: [Character?] = []

        while !remains.isEmpty {
            let startOfWindow = max(0, times - n)
            let recentHistory = Set(history[startOfWindow..<times])

            var bestTask: Character?

            for (task, count) in remains {
                guard recentHistory.contains(task) == false else { continue }
                if bestTask == nil || count > remains[bestTask!]! {
                    bestTask = task
                }
            }

            if let bestTask {
                remains[bestTask, default: 0] -= 1
                if remains[bestTask] == 0 {
                    remains.removeValue(forKey: bestTask)
                }
                history.append(bestTask)
            } else {
                history.append(nil)
            }

            times += 1
        }

        return times
    }
}
