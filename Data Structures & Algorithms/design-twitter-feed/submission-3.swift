import HeapModule

class Twitter {
    var count = 0
    var followDict: [Int: Set<Int>] = [:]
    var tweetDict: [Int: [(count: Int, id: Int)]] = [:]

    func postTweet(_ userId: Int, _ tweetId: Int) {
        tweetDict[userId, default: []].append((count, tweetId))
        count -= 1
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        var authorList = followDict[userId] ?? []
        authorList.insert(userId)
        var heap = Heap<Entry>()

        for author in authorList {
            guard let list = tweetDict[author], !list.isEmpty else { continue }
            let last = list.count - 1
            let (c, id) = list[last]
            let entry = Entry(id: id, author: author, count: c, next: last - 1)
            heap.insert(entry)
        }

        var feed = [Int]()
        while feed.count < 10, let entry = heap.popMin() {
            feed.append(entry.id)
            if entry.next >= 0 {
                let (c, id) = tweetDict[entry.author]![entry.next]
                let next = Entry(id: id, author: entry.author, count: c, next: entry.next - 1)
                heap.insert(next)
            }
        }

        return feed

    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        followDict[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followDict[followerId, default: []].remove(followeeId)
    }
}

private struct Entry: Comparable {
    let id: Int
    let author: Int
    let count: Int
    let next: Int

    static func < (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.count < rhs.count
    }
}