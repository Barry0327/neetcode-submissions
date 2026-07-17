class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
            var pair = zip(position, speed).map { ($0, $1)}
            pair.sort { $0.0 > $1.0 }
            var stack = [Double]()

            for (p, s) in pair {
                let times = Double(target - p) / Double(s)
                stack.append(times)
                if stack.count >= 2, stack.last! <= stack[stack.count - 2] {
                    stack.removeLast()
                }
            }
            return stack.count
    }
}
