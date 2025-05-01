//
//  AppIntent.swift
//  Reddit_Widget
//
//  Created by Alexander Blong on 29/04/2025.
//

import WidgetKit
import AppIntents // supports WidgetKit

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource { "Configuration" }
    static var description: IntentDescription { "This is an example widget." }

    // An example configurable parameter.
    @Parameter(title: "Favorite Emoji", default: "😃")
    var favoriteEmoji: String
}
