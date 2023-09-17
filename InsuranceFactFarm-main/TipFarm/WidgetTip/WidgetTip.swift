//
//  WidgetTip.swift
//  WidgetTip
//
//  Created by David Perez on 9/16/23.
//

import WidgetKit
import SwiftUI

/*
 struct Provider: TimelineProvider {
 func placeholder(in context: Context) -> SimpleEntry {
 SimpleEntry(date: Date(), count: 0)
 }
 
 func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
 let entry = SimpleEntry(date: Date(), count: 0)
 completion(entry)
 }
 
 func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
 var entries: [SimpleEntry] = []
 var loginCount = 0
 
 // Generate a timeline consisting of five entries an hour apart, starting from the current date.
 if let sharedDefaults = UserDefaults(suiteName: "your.app.group.identifier") {
 loginCount = sharedDefaults.integer(forKey: "mySharedValue")
 // Use the shared value in your widget
 entries.append(SimpleEntry(date: Date(), count: loginCount))
 }
 
 let timeline = Timeline(entries: entries, policy: .atEnd)
 completion(timeline)
 }
 }
 
 struct SimpleEntry: TimelineEntry {
 var date: Date
 
 let count: Int
 }
 
 /*
  class SharedDataManager {
  static let shared = SharedDataManager()
  var sharedValue: Int = 0
  }
  */
 
 struct SharedDataManager {
 var sharedValue: Int
 
 init() {
 // Attempting to read from UserDefaults
 self.sharedValue = UserDefaults.standard.object(forKey: "myDataKey") as? Int ?? 0// Default value is 0
 print("\(sharedValue)")
 }
 }
 
 struct WidgetTipEntryView : View {
 var entry: Provider.Entry
 @State var loginCount = 0
 var sharedDataManager = SharedDataManager()
 
 var body: some View {
 
 Circle()
 .stroke(lineWidth: 15)
 .foregroundColor(Color.red)
 .opacity(0.2)
 .overlay(content: {
 Circle()
 .trim(from: 0, to: CGFloat(entry.count)/7)
 .stroke(
 Color.pink,
 lineWidth: 15
 )
 //Text("\(entry.count)🔥")
 //.font(.largeTitle)
 })
 .padding(20)
 .onAppear{
 /*
  if let loginCount = UserDefaults.standard.object(forKey: "myDataKey") as? Int{
  print("\(loginCount)")
  self.loginCount = loginCount
  }
  */
 
 }
 
 Circle()
 }
 
 
 }
 
 struct WidgetTip: Widget {
 let kind: String = "WidgetTip"
 
 var body: some WidgetConfiguration {
 StaticConfiguration(kind: kind, provider: Provider()) { entry in
 WidgetTipEntryView(entry: entry)
 }
 .configurationDisplayName("My Widget")
 .description("This is an example widget.")
 }
 }
 
 struct WidgetTip_Previews: PreviewProvider {
 static var previews: some View {
 WidgetTipEntryView(entry: SimpleEntry(date: Date(), count: 0))
 .previewContext(WidgetPreviewContext(family: .systemSmall))
 }
 }
 */
