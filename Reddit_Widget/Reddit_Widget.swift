// Reddit_Widget.swift
import WidgetKit
import SwiftUI
import Intents

@main
struct Reddit_Widget: Widget {
    let kind: String = "Reddit_Widget"

    var body: some WidgetConfiguration {
        IntentConfiguration(
            kind: kind,
            intent: SubredditSelectionIntent.self,
            provider: Provider()
        ) { entry in
            Reddit_WidgetView(entry: entry)
        }
        .configurationDisplayName("Reddit Subreddit Viewer")
        .description("Pick one of four subreddits to see its top posts.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
