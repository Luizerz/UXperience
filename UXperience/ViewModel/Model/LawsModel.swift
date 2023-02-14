//
//  LawsModel.swift
//  UXperience
//
//  Created by Nillia Sousa on 28/11/22.
//

import Foundation

struct LawsModel: Codable {
    let categoria: Categoria
    let titulo, resumo: String
    let leiaMais: String
    let asset: String
    let exemplo: String
}

enum Categoria: String, Codable {
    case cognitiveBias = "Viés Cognitivo"
    case gestalt = "gestalt"
    case heuristica = "heurística"
    case principio = "princípio"
}
