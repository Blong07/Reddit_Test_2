// Reddit_WidgetView.swift
import SwiftUI
import WidgetKit

struct Reddit_WidgetView: View {
    let entry: RedditEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("r/\(entry.subreddit)")
                .font(.headline)
                .lineLimit(1)

            ForEach(entry.posts) { post in
                Text("• " + post.title)
                    .font(.caption)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding(8)
    }
}
