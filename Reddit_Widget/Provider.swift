// Provider.swift
import WidgetKit
import SwiftUI
import Intents

struct RedditEntry: TimelineEntry {
    let date: Date
    let posts: [RedditPost]
    let subreddit: String
    typealias Intent = SubredditSelectionIntent
}

struct Provider: IntentTimelineProvider {
    typealias Intent = SubredditSelectionIntent

    func placeholder(in context: Context) -> RedditEntry {
        RedditEntry(date: .now, posts: [], subreddit: "news")
    }

    func getSnapshot(
        for intent: SubredditSelectionIntent,
        in context: Context,
        completion: @escaping (RedditEntry) -> Void
    ) {
        let entry = RedditEntry(
            date: .now,
            posts: [],
            subreddit: intent.subreddit?.identifier ?? "news"
        )
        completion(entry)
    }

    func getTimeline(
        for intent: SubredditSelectionIntent,
        in context: Context,
        completion: @escaping (Timeline<RedditEntry>) -> Void
    ) {
        let sub = intent.subreddit?.identifier ?? "news"
        fetchPosts(for: sub) { posts in
            let entry = RedditEntry(date: .now, posts: posts, subreddit: sub)
            let next = Calendar.current.date(byAdding: .hour, value: 1, to: .now)!
            completion(Timeline(entries: [entry], policy: .after(next)))
        }
    }

    private func fetchPosts(
        for subreddit: String,
        completion: @escaping ([RedditPost]) -> Void
    ) {
        let groupId = "group.2_Test_Reddit_BlongX"
        let defaults = UserDefaults(suiteName: groupId)!
        guard let token = defaults.string(forKey: "reddit_access_token") else {
            return completion([])
        }

        var req = URLRequest(
            url: URL(string: "https://oauth.reddit.com/r/\(subreddit)/hot?limit=4")!
        )
        req.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: req) { data, _, _ in
            guard
                let data = data,
                let listing = try? JSONDecoder().decode(RedditListing.self, from: data)
            else {
                return completion([])
            }
            completion(listing.posts)
        }
        .resume()
    }
}
