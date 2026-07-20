class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        let cars = zip(position, speed).sorted { $0.0 > $1.0 }
        var result = 0
        var slowestAhead = 0.0

        for (p, s) in cars {
            let times = Double(target - p) / Double(s)
            if times > slowestAhead {
                result += 1
                slowestAhead = times
            }
        }

        return result
    }
}
