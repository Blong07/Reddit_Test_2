// Reddit_WidgetBundle.swift
import WidgetKit
import SwiftUI

//@main
struct Reddit_WidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        Reddit_Widget()
        // Add more widgets here later if you like
    }
}
