class Twitter {
    var tweets: [Tweet] = []
    var followDict: [Int: Set<Int>] = [:]

    func postTweet(_ userId: Int, _ tweetId: Int) {
        let tweet = Tweet(id: tweetId, userId: userId)
        tweets.append(tweet)
    }

    func getNewsFeed(_ userId: Int) -> [Int] {
        var count = 0
        var _tweets = [Int]()
        let followedIds = followDict[userId] ?? []
        for index in stride(from: tweets.count - 1, through: 0, by: -1) {
            if count == 10 { break }
            let tweet = tweets[index]
            if followedIds.contains(tweet.userId) || tweet.userId == userId {
                _tweets.append(tweet.id)
                count += 1
            } 
        }
        return _tweets
    }

    func follow(_ followerId: Int, _ followeeId: Int) {
        followDict[followerId, default: []].insert(followeeId)
    }

    func unfollow(_ followerId: Int, _ followeeId: Int) {
        followDict[followerId, default: []].remove(followeeId)
    }
}

struct Tweet {
    let id: Int
    let userId: Int
}