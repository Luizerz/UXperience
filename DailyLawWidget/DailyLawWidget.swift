//
//  DailyLawWidget.swift
//  DailyLawWidget
//
//  Created by Luiz Sena on 06/03/23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> DailyLawEntry {
        DailyLawEntry(date: Date(), configuration: ConfigurationIntent(), DailyModel: DailyLaw(links: "", lei: "", titulo: ""))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (DailyLawEntry) -> ()) {

        let entry = DailyLawEntry(date: Date(), configuration: configuration, DailyModel: DailyLaw(links: "", lei: "", titulo: ""))
        completion(entry)
    }
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        Task {
            var entries: [DailyLawEntry] = []
            let test = await API.getDailyLaw()

            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
            let currentDate = Date()
            for dayOffSet in 0 ..< 7 {
                let entryDate = Calendar.current.date(byAdding: .day, value: dayOffSet, to: currentDate)!
                let startOfDate = Calendar.current.startOfDay(for: entryDate)
                let entry = DailyLawEntry(date: startOfDate, configuration: configuration, DailyModel: test)

                entries.append(entry)
            }

            let timeline = Timeline(entries: entries, policy: .atEnd)
            completion(timeline)
        }
    }
}

struct DailyLawEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let DailyModel: DailyLaw
}

struct DailyLawWidgetEntryView : View {
    var entry: DailyLawEntry

    var body: some View {
        VStack {
            HStack {
                Text("Leis de UX")
                    .padding()
                    .fontWeight(.bold)
                    .foregroundColor(Color("newsLabelColor"))
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .background(Color("background"))
            Spacer()
            HStack{
                Text("Artigo")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color("articleColor"))
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                Spacer()
            }
            HStack{
                Text(entry.DailyModel.titulo)
                    .font(.custom("SF Pro Display", size: 14))
                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 0))
                Spacer()
            }

            Spacer()
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("WidgetBackground").gradient)
            .widgetURL(entry.DailyModel.getURL())
    }
}

struct DailyLawWidget: Widget {
    let kind: String = "DailyLawWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            DailyLawWidgetEntryView(entry: entry)

        }
        .configurationDisplayName("UXperience")
        .description("A Daily Example Law.")
        .supportedFamilies([.systemMedium])
    }
}

struct DailyLawWidget_Previews: PreviewProvider {
    static var previews: some View {
        DailyLawWidgetEntryView(entry: DailyLawEntry(date: Date(), configuration: ConfigurationIntent(), DailyModel: DailyLaw(links: "", lei: "", titulo: "")))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
