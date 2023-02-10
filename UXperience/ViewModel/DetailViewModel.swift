//
//  ViewModel.swift
//  UXperience
//
//  Created by Luiz Sena on 23/11/22.
//

import Foundation
import UIKit

protocol ViewModelBinding: AnyObject {
    func reloadCollection()
}

class DetailViewModel {

    weak var binding: ViewModelBinding? = nil
    var filterdJson: [LawsModel] = []

    // virá da camada service
    let newsLabel: String = "Artigo Medium"

    var uxLaws = ReadJsonLaws().loadjson() {
        didSet {
            binding?.reloadCollection()
        }
    }

    // Funcao de filtragem por categoria dos cards na tela principal
    func getFilterByCategory(with labelText: String) {
        let json = ReadJsonLaws.instance.loadjson()
        switch labelText {
            
        case "Heuristica":
            var heuristica: [LawsModel] = []
            for model in json {
                if model.categoria == .heuristica {
                    heuristica.append(model)
                }
            }
            self.uxLaws = heuristica

            
        case "Principio":
            var principio: [LawsModel] = []
            for model in json {
                if model.categoria == .principio {
                    principio.append(model)
                }
            }
            self.uxLaws = principio
            
        case "Gestalt":
            var gestalt: [LawsModel] = []
            for model in json {
                if model.categoria == .gestalt {
                    gestalt.append(model)
                }
            }
            self.uxLaws = gestalt
            
        case "Vies Cognitivo":
            var viesCognitivo: [LawsModel] = []
            for model in json {
                if model.categoria == .cognitiveBias {
                    viesCognitivo.append(model)
                }
            }
            self.uxLaws = viesCognitivo
            
        default:
            self.uxLaws = ReadJsonLaws.instance.loadjson()
            break
        }
    }
    //"Todos", "Heuristica", "Principles", "Gestalt", "Cognitive"

    // filtragem pela searchbar
    // MARK: ajeitar o bug do case sensitive
    func filterJson(with filterString: String) {
        let uxLaws = ReadJsonLaws().loadjson()
        filterdJson = []
        if filterString.isEmpty {
            self.uxLaws = uxLaws
        } else {
            for law in uxLaws {
                if law.titulo.contains(filterString) {
                    filterdJson.append(law)
                }
            }
            self.uxLaws = self.filterdJson
        }
    }
}
