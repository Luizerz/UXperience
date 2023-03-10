// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dailyLaws = try? JSONDecoder().decode(DailyLaws.self, from: jsonData)

import Foundation

// MARK: - DailyLaw
struct DailyLaw: Codable {
    let links, lei, titulo: String

    func getURL() -> URL {
        return URL(string: self.links) ?? URL(string: "https://google.com")!
    }
}

typealias DailyLaws = [DailyLaw]

