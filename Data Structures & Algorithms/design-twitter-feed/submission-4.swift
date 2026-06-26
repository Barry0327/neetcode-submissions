class Twitter {
    private var followDict: [Int: Set<Int>] = [:]
    private var count: Int = 0
    private var tweetDict: [Int: [(count: Int, id: Int)]] = [:]

    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweetDict[userId, default: []].append((count, tweetId))
        count += 1
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        // Fetches 10 most recent tweet from who the user is following or by the user themself
        // Should return in ordered from most recent to least recent
        // Need some kind of mechanism to know the order
        // Need to know the order from all the tweets, not only specific users
        // We should not fetch all tweet from all target users, it will be too slow
        // We need a way to fetch the most recent one tweet from all following and the user themself
        // Then pop the most recent tweet to the result, and then fetch one more recent tweet from the user that most recent tweet has pass to result
        var authorList = followDict[userId] ?? []
        authorList.insert(userId)

        var maxHeap: MaxHeap<Entity> = MaxHeap()
        for author in authorList {
            guard let list = tweetDict[author], list.isEmpty == false else { continue }
            let (count, id) = list[list.count - 1]
            let entity = Entity(id: id, author: author, count: count, next: list.count - 2)
            maxHeap.insert(entity)
        }

        var result = [Int]()
        while result.count < 10, let entity = maxHeap.pop() {
            result.append(entity.id)
            if let list = tweetDict[entity.author], entity.next >= 0 {
                let (count, id) = list[entity.next]
                let next = Entity(id: id, author: entity.author, count: count, next: entity.next - 1)
                maxHeap.insert(next)
            }
        }
        return result
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        followDict[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followDict[followerId, default: []].remove(followeeId)
    }
}

struct Entity: Comparable {
    let id: Int
    let author: Int
    let count: Int
    let next: Int

    static func < (_ lhs: Entity, _ rhs: Entity) -> Bool {
        return lhs.count < rhs.count
    }
}

struct MaxHeap<Element: Comparable> {
    private var data: [Element] = []

    var isEmpty: Bool {
        data.isEmpty
    }

    mutating func insert(_ element: Element) {
        data.append(element)
        var child = data.count - 1
        while child > 0 {
            let parent = (child - 1) / 2
            guard data[child] > data[parent] else { break }
            data.swapAt(child, parent)
            child = parent
        }
    }

    mutating func pop() -> Element? {
        guard !isEmpty else { return nil }
        let value = data[0]
        data[0] = data[data.count - 1]
        data.removeLast()

        var i = 0
        while true {
            let l = (i * 2) + 1
            let r = (i * 2) + 2
            var candidate = i
            if l < data.count && data[candidate] < data[l] { candidate = l }
            if r < data.count && data[candidate] < data[r] { candidate = r }
            if candidate == i { break }
            data.swapAt(candidate, i)
            i = candidate
        } 

        return value
    }
}
