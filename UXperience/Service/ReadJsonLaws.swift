//
//  Service.swift
//  UXperience
//
//  Created by Luiz Sena on 23/11/22.
//

import Foundation

class ReadJsonLaws {
    
    static let instance = ReadJsonLaws()
    

    func loadjson() -> [LawsModel] {
        if let url = Bundle.main.url(forResource: "laws", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData: [LawsModel] =  try decoder.decode([LawsModel].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }

        return [LawsModel(categoria: Categoria.cognitiveBias, titulo: "Error", resumo: "", leiaMais: "", asset: "", exemplo: "")]
    }
}
