//
//  API.swift
//  UXperience
//
//  Created by Luiz Sena on 08/03/23.
//

import Foundation

public class API {

    static func getDailyLaw() async -> DailyLaw {
        let url: URL = URL(string: "https://sheetlabs.com/LMSM/UXperienceAPI")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let userDecoded = try JSONDecoder().decode(DailyLaws.self, from: data)
            print(userDecoded)
            return userDecoded.randomElement()!
        } catch {
            print(error)
        }

        return DailyLaw(links: "", lei: "", titulo: "")
    }

}
