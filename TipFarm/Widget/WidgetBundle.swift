//
//  WidgetBundle.swift
//  Widget
//
//  Created by David Perez on 9/16/23.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        WidgetEntryView()
        AnotherWidgetEntryView()
    }
}

struct WidgetEntryView: Widget {
    var body: some WidgetConfiguration {
        // Configuration for your first widget
        StaticConfiguration(
            kind: "Widget1",
            provider: Widget1Provider()
        ) { entry in
            Widget1View(entry: entry)
        }
        .configurationDisplayName("Widget 1")
        .description("This is widget 1")
    }
}

struct AnotherWidgetEntryView: Widget {
    var body: some WidgetConfiguration {
        // Configuration for your second widget
        StaticConfiguration(
            kind: "Widget2",
            provider: Widget2Provider()
        ) { entry in
            Widget2View(entry: entry)
        }
        .configurationDisplayName("Widget 2")
        .description("This is widget 2")
    }
}

// Widget 1 Provider
struct Widget1Provider: TimelineProvider {
    // Implementation for Widget1Provider
}

// Widget 2 Provider
struct Widget2Provider: TimelineProvider {
    // Implementation for Widget2Provider
}

// Widget 1 View
struct Widget1View: View {
    // Implementation for Widget1View
}

// Widget 2 View
struct Widget2View: View {
    // Implementation for Widget2View
}
