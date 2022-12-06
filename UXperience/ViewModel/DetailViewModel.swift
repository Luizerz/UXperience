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

    // virá da camada service
    let newsLabel: String = "Artigo Medium"

    var uxLaws = ReadJsonLaws().loadjson() {
        didSet {
            binding?.reloadCollection()
        }
    }

    var filterdJson: [LawsModel] = []

    func configureNewsLabel(with label: UILabel)  {
        label.text = self.newsLabel
    }

    func printJSON() {
        print(uxLaws)
    }

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
