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
}

enum Categoria: String, Codable {
    case cognitiveBias = "Cognitive Bias"
    case gestalt = "gestalt"
    case heuristica = "heuristica"
    case principio = "principio"
}
